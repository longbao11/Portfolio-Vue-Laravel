<script setup>
import profileImage from '@/assets/ProfilePicture.jpg';
</script>

<template>
    <section id="home"
        class="lg:h-[90vh] flex items-center justify-center bg-light-primary dark:bg-dark-primary py-20 lg:py-0 overflow-hidden relative isolate px-6 lg:px-8 scroll-mt-24 pt-24 sm:pt-24">

        <!-- Top Background Blob -->
        <!-- <div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80"
            aria-hidden="true">
            <div class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72rem]"
                style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)">
            </div>
        </div> -->

        <!-- Flex container: column on mobile, row on desktop -->
        <div class="flex flex-col-reverse lg:flex-row items-center justify-between w-full max-w-6xl gap-12">
            <!-- Left Content -->
            <div class="max-w-2xl text-center lg:text-left">
                <h1 class="text-5xl font-semibold tracking-tight text-gray-900 sm:text-6xl">
                    Hi, I'm Bao Long <br /> — a Web Developer
                </h1>
                <p class="mt-5 text-lg font-medium text-gray-700 sm:text-xl text-justify leading-relaxed">
                    I'm a motivated Web Developer specializing in <span class="font-semibold text-black">Angular</span>
                    and <span class="font-semibold text-black">C# ASP.NET</span>, focused on building responsive,
                    scalable and modern web applications.
                    <br /><br />
                    From crafting clean user interfaces to developing robust backend systems, I aim to deliver
                    high-quality solutions.
                    <br /><br />
                    I'm also self-learning <span class="font-semibold text-black">Vue</span> and <span
                        class="font-semibold text-black">Laravel</span> to broaden my full-stack capabilities.
                </p>



                <div class="mt-6 flex items-center justify-center lg:justify-start gap-x-6">
                    <a href="/CHONG BAO LONG_Resume.pdf" download
                        class="rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                        Download Resume
                    </a>

                </div>
            </div>

            <!-- Right Profile Image -->
            <div class="flex justify-center lg:justify-end">
                <img :src="profileImage" alt="Profile"
                    class=" sm:w-48 sm:h-48 lg:w-64 lg:h-64 rounded-full object-cover border-4 border-indigo-300 shadow-xl" />
            </div>
        </div>

        <!-- Bottom Background Blob -->
        <!-- <div class="absolute inset-x-0 top-[calc(100%-13rem)] -z-10 transform-gpu overflow-hidden blur-3xl sm:top-[calc(100%-30rem)]"
            aria-hidden="true">
            <div class="relative left-[calc(50%+3rem)] aspect-[1155/678] w-[36rem] -translate-x-1/2 bg-gradient-to-tr from-[#ff80b5] to-[#9089fc] opacity-30 sm:left-[calc(50%+36rem)] sm:w-[72rem]"
                style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)">
            </div>
        </div> -->

    </section>
</template>
