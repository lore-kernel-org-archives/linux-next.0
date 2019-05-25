From: Carlo Pisani <carlojpisani@gmail.com>
Subject: Re: C3600, sata controller
Date: Sat, 25 May 2019 10:59:27 +0200
Message-ID: <CA+QBN9BPbTHojQcSQZM1KmfsUMkajhLhmJ6jye4PdK8uXO9NcQ@mail.gmail.com>
References: <20190502074519.61272b42@canb.auug.org.au> <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Parisc List <linux-parisc@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

guys?
yahoooooooooooooooo, SYBA-SY-PCX40009 does woooork :D :D

02:03.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial
ATA Controller (rev 01)

10 hours burn-in test passed!!!!

while [ 1 ]
do
for item in `ls *.bin`
    do
        rm -f $copy.out
        echo -n "$item ... "
        time cp_and_check_md5sum $item $copy.out
        echo "done"
    done
done

kernel 5.1, from the git repository, compiled with SMP

dmesg | grep altern
[    2.551002] alternatives: applied 156 out of 175 patches

only applied this patch:

--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -52,7 +52,6 @@ void parisc_setup_cache_timing(void);

 #define asm_io_fdc(addr) asm volatile("fdc %%r0(%0)" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
-                       ALTERNATIVE(ALT_COND_NO_IOC_FDC, INSN_NOP) \
                        : : "r" (addr) : "memory")
 #define asm_io_sync()  asm volatile("sync" \
                        ALTERNATIVE(ALT_COND_NO_DCACHE, INSN_NOP) \
