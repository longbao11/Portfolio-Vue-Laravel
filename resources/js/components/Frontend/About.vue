<script setup lang="ts">
import { ref } from 'vue';
import schoolIcon from '@/assets/School.png';
import { onMounted } from 'vue';

const education = ref([
    {
        id: 1,
        school: 'Universiti Tunku Abdul Rahman (UTAR)',
        program: 'Bachelor of Computer Science (HONS)',
        year: 'Jan 2021 - Jan 2024',
    },
    {
        id: 2,
        school: 'Tunku Abdul Rahman University of Management & Technology',
        program: 'Diploma in Internet Technology',
        year: 'June 2018 - June 2020',
    }
]);

const leftVisible = ref(false);
const rightVisible = ref(false);
const leftSection = ref(null);
const rightSection = ref(null);

onMounted(() => {
    const observerLeft = new IntersectionObserver(([entry]) => {
        leftVisible.value = entry.isIntersecting;
    }, { threshold: 0.3 });

    const observerRight = new IntersectionObserver(([entry]) => {
        rightVisible.value = entry.isIntersecting;
    }, { threshold: 0.3 });

    if (leftSection.value) observerLeft.observe(leftSection.value);
    if (rightSection.value) observerRight.observe(rightSection.value);
});

</script>

<template>
    <section class="text-white mt-18 scroll-mt-24" id="about">
        <!-- Gradient Background -->
        <div class="absolute z-0 top-[93rem] inset-x-0 h-64 flex items-start">
            <div class="h-24 w-64 bg-gradient-to-br from-red-400 via-yellow-300 to-[#570cac] blur-2xl opacity-20"></div>
        </div>

        <!-- Content -->
        <div class="md:grid md:grid-cols-2 gap-8 items-center py-8 px-4 xl:gap-16 sm:py-16 xl:px-16 z-1">
            <!-- Left side: My Education -->
            <div ref="leftSection" :class="[
                'transition-all duration-700 ease-out transform',
                leftVisible ? 'opacity-100 rotate-0' : 'opacity-0 -rotate-6'
            ]">
                <h2 class="text-4xl font-bold text-black text-left mb-8">My Education</h2>
                <div class="space-y-8 py-8">
                    <div v-for="element in education" :key="element.id"
                        class="flex items-center md:w-[80%] w-full h-32 rounded-xl bg-slate-800 shadow-md border border-slate-700/60 hover:shadow-lg transition-all duration-300">
                        <div class="w-1/4 flex items-center justify-center">
                            <img :src=schoolIcon alt="school_icon" class="w-15 h-15" />
                        </div>
                        <div class="w-3/4 pl-4">
                            <h3
                                class="text-xl font-semibold text-transparent bg-gradient-to-r from-red-400 to-yellow-300 bg-clip-text">
                                {{ element.school }}
                            </h3>
                            <p class="text-white">{{ element.program }}</p>
                            <p class="text-white text-sm italic">{{ element.year }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right side: More About Me -->
            <div ref="rightSection" :class="[
                'transition-all duration-700 ease-out transform mt-4 md:mt-0 text-left flex flex-col z-10 h-full',
                rightVisible ? 'opacity-100 rotate-0' : 'opacity-0 rotate-6'
            ]">
                <h2 class="text-4xl font-bold text-black md:text-center text-left mb-4">
                    More About Me
                </h2>
                <p class="text-black lg:text-lg mt-8 py-8 text-justify leading-relaxed">
                    I’m a motivated Software Engineer with hands-on experience in full-stack development, API
                    integration and database management.
                    Skilled in <span class="font-semibold">C#, ASP.NET, Angular,</span> and <span
                        class="font-semibold">SQL</span>. With a solid grasp of the software development lifecycle
                    (SDLC), version control and Agile practices.
                    <br /><br />
                    I thrive in collaborative teams, enjoy solving complex problems and continuously seek growth
                    through learning.
                    Currently open to full-time opportunities as a Software Engineer.
                </p>

            </div>
        </div>
    </section>
</template>
