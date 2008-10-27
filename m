From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: Re: build failure on sparc64 (Re: linux-next: Tree for October 27)
Date: Mon, 27 Oct 2008 19:43:24 +0400
Message-ID: <a4423d670810270843j55cf1bd9s223aaa447667903e@mail.gmail.com>
References: <a4423d670810270816x20ea60a7s4fdee99b046a15a4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <a4423d670810270816x20ea60a7s4fdee99b046a15a4@mail.gmail.com>
Content-Disposition: inline
Sender: sparclinux-owner@vger.kernel.org
To: ananth@in.ibm.com
Cc: linux-next@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

2008/10/27 Alexander Beregalov <a.beregalov@gmail.com>:
> init/built-in.o: In function `start_kernel':
> /home/alexb/linux-2.6/init/main.c:648: undefined reference to `locking_selftest'
> kernel/built-in.o: In function `init_kprobes':
> /home/alexb/linux-2.6/kernel/kprobes.c:1106: undefined reference to
> `init_test_probes'
>

Hm, it was strange situation

`make image` runs oldconfig, after that config was the following:
CONFIG_KERNEL_TESTS disabled
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_KPROBES_SANITY_TEST=y

But they both are under "if KERNEL_TESTS" condition in test/Kconfig.
Strange, I can not reproduce it anymore
