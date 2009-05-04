From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 4 (staging/comedi)
Date: Mon, 04 May 2009 11:15:12 -0700
Message-ID: <49FF30B0.1020907@oracle.com>
References: <20090504170810.64cdceb4.sfr@canb.auug.org.au> <49FF0EEA.1010605@oracle.com> <20090504161232.GB11723@kroah.com> <49FF1596.2020503@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932300AbZEDSNz@vger.kernel.org>
In-Reply-To: <49FF1596.2020503@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap wrote:
> Greg KH wrote:
>> On Mon, May 04, 2009 at 08:51:06AM -0700, Randy Dunlap wrote:
>>> Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> Changes since 20090501:
>>> build-r4048.out:ERROR: "ni_tio_rinsn" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "ni_tio_winsn" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "ni_tio_insn_config" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "ni_tio_init_counter" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "ni_gpct_device_construct" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "ni_gpct_device_destroy" [drivers/staging/comedi/drivers/ni_mio_cs.ko] undefined!
>>> build-r4048.out:ERROR: "labpc_1200_is_unipolar" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
>>> build-r4048.out:ERROR: "labpc_1200_ai_gain_bits" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
>>> build-r4048.out:ERROR: "range_labpc_1200_ai" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
>>> build-r4048.out:ERROR: "labpc_common_detach" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
>>> build-r4048.out:ERROR: "labpc_common_attach" [drivers/staging/comedi/drivers/ni_labpc_cs.ko] undefined!
>>> build-r4048.out:ERROR: "das08_cs_boards" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
>>> build-r4048.out:ERROR: "das08_common_detach" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
>>> build-r4048.out:ERROR: "das08_common_attach" [drivers/staging/comedi/drivers/das08_cs.ko] undefined!
>>>
>>>
>>> config attached.
>> CONFIG_PCMCIA is allowed to be set without CONFIG_PCI?  That sounds like
>> the problem there (not to mention pretty much an impossible real-world
>> combination...)
> 
> PCMCIA is (was?) a 16-bit ISA-like bus.
> That's not PCCard (PCI-like).

Looks to me like some of those COMEDI_PCMCIA_DRIVERS should depend on
PCCARD instead of PCMCIA (but not necessarily all of them, although
that would be the easy fix).

-- 
~Randy
