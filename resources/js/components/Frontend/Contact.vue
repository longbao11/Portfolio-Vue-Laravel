<script setup>
import Email from '@/assets/Email.png';
import Phone from '@/assets/Phone.png';
import LinkedIn from '@/assets/Linkedin.png';
import { useScrollReveal } from '@/composables/useScrollReveal';
import { useForm } from '@inertiajs/vue3';
import { Toaster, toast } from 'vue-sonner';
import 'vue-sonner/style.css';

const { visible, targetRef } = useScrollReveal();

const form = useForm({
    email: '',
    subject: '',
    message: '',
});

const handleSubmit = () => {
    form.post(route('feedback.store'), {
        preserveScroll: true,
        onSuccess: () => {
            toast.success('Message sent successfully!', {
                description: 'I’ll get back to you soon!',
            });
            form.reset();
        },
        onError: () => {
            toast.error('Failed to send. Please check your inputs.');
            console.log('Validation errors:', form.errors);
        },
    });
};
</script>

<template>
    <Toaster class="pointer-events-auto" richColors />

    <section id="contact" ref="targetRef" :class="[
        'text-black scroll-mt-24 py-10 overflow-hidden transition-all duration-700 ease-out',
        visible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-12'
    ]">
        <h2 class="text-4xl font-bold text-black text-left mb-4 px-4 xl:pl-16">Let's Connect!!</h2>

        <div class="grid md:grid-cols-2 gap-6 px-4 xl:px-16 mt-8">
            <!-- Left -->
            <div class="space-y-6">
                <p class="text-black text-justify">
                    I’m currently looking for opportunities where I can contribute my skills in web development and grow
                    as a developer. <br /> Feel free to get in touch. I’d love to hear from you.
                </p>

                <div class="space-y-6">
                    <div class="flex items-center">
                        <div
                            class="w-12 h-12 flex justify-center items-center rounded-full overflow-hidden backdrop-blur">
                            <img :src="Email" alt="email" class="w-full h-full object-contain" />
                        </div>
                        <div class="ml-5 text-black">
                            <h4>Email:</h4>
                            <a href="mailto:longbao572@gmail.com" class="text-blue-600 hover:underline">
                                longbao572@gmail.com
                            </a>
                        </div>
                    </div>

                    <div class="flex items-center">
                        <div
                            class="w-12 h-12 flex justify-center items-center rounded-full overflow-hidden backdrop-blur">
                            <img :src="Phone" alt="phone" class="w-full h-full object-contain" />
                        </div>
                        <div class="ml-5 text-black">
                            <h4>Phone:</h4>
                            <p>+65 8543 0239</p>
                        </div>
                    </div>

                    <div class="flex items-center">
                        <div
                            class="w-12 h-12 flex justify-center items-center rounded-full overflow-hidden backdrop-blur">
                            <img :src="LinkedIn" alt="linkedin" class="w-full h-full object-cover" />
                        </div>
                        <div class="ml-5 text-black">
                            <h4>LinkedIn:</h4>
                            <a href="https://www.linkedin.com/in/bao-long-chong-156974300/" target="_blank"
                                class="text-blue-600 hover:underline">
                                LinkedIn Profile
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right: Contact Form -->
            <div>
                <div
                    class="w-full max-w-md sm:max-w-lg md:max-w-xl lg:max-w-2xl mx-auto bg-slate-50 rounded-2xl overflow-hidden border border-slate-200 shadow-md backdrop-blur-md">
                    <form class="flex flex-col p-6" @submit.prevent="handleSubmit">
                        <div class="mb-6">
                            <label for="email" class="text-slate-800 block mb-2 text-sm font-semibold">Email:</label>
                            <input type="email" id="email" v-model="form.email" placeholder="Email@gmail.com"
                                class="bg-slate-100 border border-slate-300 text-slate-700 text-sm rounded-md block w-full p-3 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                            <div class="text-sm text-red-600" v-if="form.errors.email">{{ form.errors.email }}</div>
                        </div>

                        <div class="mb-6">
                            <label for="subject"
                                class="text-slate-800 block mb-2 text-sm font-semibold">Subject:</label>
                            <input type="text" id="subject" v-model="form.subject" placeholder="Subject"
                                class="bg-slate-100 border border-slate-300 text-slate-700 text-sm rounded-md block w-full p-3 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                            <div class="text-sm text-red-600" v-if="form.errors.subject">{{ form.errors.subject }}</div>
                        </div>

                        <div class="mb-6">
                            <label for="message"
                                class="text-slate-800 block mb-2 text-sm font-semibold">Message:</label>
                            <textarea id="message" v-model="form.message" rows="4" placeholder="Let's talk about ..."
                                class="bg-slate-100 border border-slate-300 text-slate-700 text-sm rounded-md block w-full p-3 placeholder-slate-400 focus:outline-none focus:ring-2 focus:ring-indigo-400"></textarea>
                            <div class="text-sm text-red-600" v-if="form.errors.message">{{ form.errors.message }}</div>
                        </div>

                        <button type="submit" :disabled="form.processing"
                            class="w-full px-6 py-3 rounded-full bg-gradient-to-r from-indigo-500 to-purple-500 text-white font-semibold hover:opacity-90 transition-all duration-300">
                            Send Message
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</template>
