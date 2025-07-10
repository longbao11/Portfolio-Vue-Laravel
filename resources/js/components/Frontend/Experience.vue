<script setup lang="ts">
import { ref } from 'vue';
import workIcon from '@/assets/Developer.png';
import logisticsIcon from '@/assets/Logistics.png';
import { useScrollReveal } from '@/composables/useScrollReveal';

const skills = ref([
    {
        id: 1,
        name: 'HTML/CSS',
        width: '70%',
    },
    {
        id: 2,
        name: 'JavaScript / TypeScript',
        width: '65%',
    },
    {
        id: 3,
        name: 'Angular / Vue',
        width: '68%',
    },
    {
        id: 4,
        name: 'C# / ASP.NET',
        width: '65%',
    },
    {
        id: 5,
        name: 'MySQL',
        width: '70%',
    }
]);

const experiences = ref([
    {
        id: 1,
        role: 'Logistics Coordinator | Sept 2024 - April 2025',
        company: 'DECLARATORS PTE LTD | Singapore',
        description: 'Coordinated delivery schedules and resolved logistics issues with suppliers and customers.'
    },
    {
        id: 2,
        role: 'Software Engineer | Jan 2024 - Aug 2024',
        company: 'EDESK SDN BHD | Kuala Lumpur',
        description: 'Developed TNB Project using Angular, ASP.NET & PostgreSql.'

    },
    {
        id: 3,
        role: 'Software Engineer (Internship) | Aug 2023 - Nov 2023',
        company: 'CORETECH SERVCES SDN BHD | Kuala Lumpur',
        description: 'Developed MSIG Asia Project using Angular, ASP.NET Core & MSSQL.'
    },
    {
        id: 4,
        role: 'Software Engineer (Internship) | Feb 2020 - April 2020',
        company: 'SENWAVE RETAIL SOLUTION SDN BHD | Kuala Lumpur',
        description: 'Developed over 50+ SQL queries for SENHENG Website.'
    },
]);

const { visible, targetRef } = useScrollReveal();

</script>

<template>
    <section class="text-white scroll-mt-10" id="experience" ref="targetRef">

        <div class="absolute right-0 top-[110rem] h-full w-full justify-end">
            <span class="flex opacity-20">
                <span class="w-16 h-32 rounded-l-full flex bg-yellow-500 blur-2xl"></span>
                <span class="w-16 h-32 rounded-r-full flex bg-[#f88fc2] blur-2xl mt-14"></span>
            </span>
        </div>

        <div :class="[
            'transition-all duration-700 ease-out',
            visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-12'
        ]">

            <div class="md:grid md:grid-cols-2 gap-8 items-center py-8 px-4 xl:gap-16 xl:px-16">
                <div class="mt-4 md:mt-0 text-left flex flex-col z-10 h-full w-[80%]">
                    <h2 class="text-4xl font-bold text-black text-left mb-4">My Skills
                    </h2>
                    <div class="mt-8" v-for="skill in skills" :key="skill.id">
                        <div class="flex items-end justify-between">
                            <h4 class="font-semibold text-black"> {{ skill.name }}</h4>
                            <h3 class="text-2xl font-bold text-black">{{ skill.width }}</h3>
                        </div>
                        <div class="mt-2 h-1 w-full bg-indigo-300 rounded-full">
                            <div class="h-1 rounded-full bg-indigo-700" :style="`width :${skill.width}`"></div>
                        </div>
                    </div>
                </div>

                <div>
                    <h2 class="text-4xl font-bold text-black text-left mb-3 md:text-center md:mt-0 mt-8">My Work
                        Experience
                    </h2>
                    <div class="space-y-3 py-3">
                        <div v-for="element in experiences" :key="element.id"
                            class="flex items-center rounded-xl p-4 bg-slate-800 shadow-md border border-slate-700/60 hover:shadow-lg transition-all duration-300">
                            <div class="w-1/4 flex items-center justify-center">
                                <img :src="element.id === 1 ? logisticsIcon : workIcon" alt="exp" class="w-20 h-20">
                            </div>
                            <div class="w-3/4 pl-4">
                                <h3
                                    class="text-sm sm:text-lg md:text-[18px] font-semibold text-transparent bg-clip-text bg-gradient-to-r from-yellow-300 to-red-500 ">
                                    {{ element.role }}
                                </h3>
                                <p class="text-emerald-400 text-sm sm:text-lg md:text-[17px]">{{ element.company }}</p>
                                <p class="text-slate-300 text-justify font-serif text-sm sm:text-lg md:text-[1em]">{{
                                    element.description }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>