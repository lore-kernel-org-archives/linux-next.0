From: John Stultz <john.stultz@linaro.org>
Subject: Re: randconfig build error with next-20131216, in drivers/staging/android/ion
Date: Mon, 16 Dec 2013 11:37:29 -0800
Message-ID: <52AF5679.1090701@linaro.org>
References: <CA+r1Zhh-ayJRcuApAh_E3ofM3Q=xH3Wo-ZHSdr7rCYd+YAKGaw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+r1Zhh-ayJRcuApAh_E3ofM3Q=xH3Wo-ZHSdr7rCYd+YAKGaw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
List-Id: linux-next.vger.kernel.org

On 12/16/2013 05:53 AM, Jim Davis wrote:
> Building with the attached random configuration file,
>
> drivers/built-in.o: In function `ion_heap_freelist_add':
> (.text+0xf292c): undefined reference to `rt_mutex_lock'
> drivers/built-in.o: In function `ion_heap_freelist_add':
> (.text+0xf2958): undefined reference to `rt_mutex_unlock'
> drivers/built-in.o: In function `ion_heap_freelist_size':
> (.text+0xf2990): undefined reference to `rt_mutex_lock'
> drivers/built-in.o: In function `ion_heap_freelist_size':
> (.text+0xf29a0): undefined reference to `rt_mutex_unlock'
> drivers/built-in.o: In function `ion_heap_deferred_free':
> ion_heap.c:(.text+0xf2a2d): undefined reference to `rt_mutex_lock'
> ion_heap.c:(.text+0xf2a48): undefined reference to `rt_mutex_unlock'
> ion_heap.c:(.text+0xf2a6e): undefined reference to `rt_mutex_unlock'
> drivers/built-in.o: In function `ion_heap_freelist_drain':
> (.text+0xf2ab2): undefined reference to `rt_mutex_lock'
> drivers/built-in.o: In function `ion_heap_freelist_drain':
> (.text+0xf2aed): undefined reference to `rt_mutex_unlock'
> drivers/built-in.o: In function `ion_heap_init_deferred_free':
> (.text+0xf2b7c): undefined reference to `__rt_mutex_init'
> make: *** [vmlinux] Error 1

Thanks for the heads up! I'll chase these down!
-john
