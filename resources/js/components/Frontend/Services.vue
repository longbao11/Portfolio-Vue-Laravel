<script setup lang="ts">
import { ref } from 'vue';
import iconWeb from '@/assets/WebDevelopment.png';
import iconTeam from '@/assets/Team.png';
import iconLearning from '@/assets/Learning.png';
import { useScrollReveal } from '@/composables/useScrollReveal';

const services = ref([
    {
        id: 1,
        icon: iconWeb,
        name: 'Web development',
        description: 'Build Responsive Website based on Requirements.',
    },
    {
        id: 2,
        icon: iconTeam,
        name: 'Teamwork',
        description: 'Collaborate Efficiently to Meet Project Goals.',
    },
    {
        id: 3,
        icon: iconLearning,
        name: 'Continuous Learning',
        description: 'Stay Updated with Latest Tech Trends.',
    },
]);

const { visible, targetRef } = useScrollReveal();

</script>

<template>
    <section class="text-white mt-20 relative z-10" id="services" ref="targetRef">

        <div class="px-4 xl:pl-16">
            <h2 class="text-4xl font-bold text-black mb-4">My Skillset</h2>
        </div>

        <div :class="[
            'transition-all duration-700 ease-out',
            visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-12',
            'py-8 xl:px-16 px-4 sm:py-16 grid grid-cols-1 gap-6 pt-10 sm:grid-cols-2 md:gap-10 md:pt-12 lg:grid-cols-3'
        ]">
            <div v-for="service in services" :key="service.id"
                class="px-8 py-12 rounded-xl bg-[#111a3e] shadow-lg border border-[#1f1641]">
                <div class="mx-auto w-20 h-20 sm:w-24 sm:h-24 md:w-28 md:h-28 text-center">
                    <img :src="service.icon" alt="icon" class="w-full h-full object-contain" />
                </div>

                <div class="text-center">
                    <h1
                        class="pt-8 text-base sm:text-lg md:text-xl lg:text-xl font-semibold uppercase text-transparent bg-clip-text bg-gradient-to-r from-red-400 to-yellow-300">
                        {{ service.name }}
                    </h1>
                    <p class="pt-4 text-sm sm:text-base md:text-lg text-gray-300 group-hover:text-white">
                        {{ service.description }}
                    </p>
                </div>
            </div>
        </div>

    </section>
</template>
