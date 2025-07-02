import { ref, onMounted, nextTick } from 'vue';

export function useScrollReveal(threshold = 0.3) {
    const visible = ref(false);
    const targetRef = ref(null);

    onMounted(async () => {
        await nextTick(); // Ensure DOM is mounted

        if (!targetRef.value) return;

        const observer = new IntersectionObserver(
            ([entry]) => {
                visible.value = entry.isIntersecting;
            },
            { threshold }
        );

        observer.observe(targetRef.value);
    });

    return {
        visible,
        targetRef,
    };
}
