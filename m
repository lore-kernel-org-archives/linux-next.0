From: "Alexander Beregalov" <a.beregalov@gmail.com>
Subject: next-0704: x86_64 panics on booting
Date: Fri, 4 Jul 2008 18:20:47 +0400
Message-ID: <a4423d670807040720o3e8e350ds5c13dfca8e8adc58@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757591AbYGDOVG@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-next@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com
List-Id: linux-next.vger.kernel.org

Hi


Booting the kernel.

Kernel alive
Kernel really alive
PANIC: early exception 0e rip 10:ffffffff80604f47 error 2 cr2 ffffffffff300000

It is x86_64 SMP (opteron).
