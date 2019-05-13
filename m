From: John David Anglin <dave.anglin@bell.net>
Subject: Re: C3600, sata controller
Date: Mon, 13 May 2019 19:14:03 -0400
Message-ID: <66bf0e79-16a4-a411-19ba-cd7d5a232976@bell.net>
References: <20190502074519.61272b42@canb.auug.org.au>
 <a645ff18-4c55-6b4c-0913-5b397ab83e03@gmx.de>
 <CA+QBN9A4PhPZ36otsk0TRaO9KKnKL=hfnskfFJGQJEbtb3=i=Q@mail.gmail.com>
 <f52cf203-c48a-fd04-5827-19903c3a192f@bell.net>
 <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+QBN9AZHQHTGFVc21UfROHObKxAZz+bwCPeMf-Tpjn2UHmDNg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Carlo Pisani <carlojpisani@gmail.com>
Cc: Parisc List <linux-parisc@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On 2019-05-12 5:15 p.m., Carlo Pisani wrote:
>> The c3600 doesn't have any PCI-X slots (only PCI) as far as I can tell from user manuals.
> PCI-32/33 device I/O bus
> PCI-64/33 high-performance device I/O bus <----------------- this is
> PCI-X, 64bit 5V
> PCI-64/66 high-performance graphics I/O bus <----------------- this is
> PCI-X, 64bit 3.3V
>
> https://www.openpa.net/systems/hp-visualize_b1000_c3000_c3600.html
I think that you are wrong.  HP would have said the slots were PCI-X compatible if they were.
They did in c8000.

The issue is probably the signalling voltage and clock rate capability.  33 MHz always uses 5V
signalling whereas PCX-X cards typically support 66 and 133 MHz.  Thus, I think PCI-X cards use
CMOS 3.3V signalling although they may accept 5V on their inputs.  If the c3600 uses older
TTL logic, it is likely that 3.3V CMOS logic can't provide the high level for 5V TTL logic.

I suspect the only slot that might work with a PCI-X card is the 3.3V SL2.  However, if you see I/O errors
in the PIM dump following a HPMC, then it's not compatible.

So, probably you would have better luck with the PCI Syba SD-SATA150R in c3600.  However, it is similar
to the Adaptec 1210SA which works.  Maybe they differ in RAID capability.

Dave

-- 
John David Anglin  dave.anglin@bell.net
