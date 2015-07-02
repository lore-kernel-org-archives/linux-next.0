From: Michal Marek <mmarek@suse.cz>
Subject: Re: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Thu, 02 Jul 2015 21:53:49 +0200
Message-ID: <559596CD.6000403@suse.cz>
References: <20150702103025.634ca1e5@canb.auug.org.au>	<CAMuHMdUCu7MWiUGW+TmVN8=T8SvPHgUoupSdf9XMn0e1mKQm3Q@mail.gmail.com>	<5594E56E.7080605@suse.cz> <CAMuHMdW7bn+jCRaL0xWG7WrVLmOsdmRgYj5F4r73vi2q3pL-Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36007 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754093AbbGBTxw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 2 Jul 2015 15:53:52 -0400
In-Reply-To: <CAMuHMdW7bn+jCRaL0xWG7WrVLmOsdmRgYj5F4r73vi2q3pL-Cg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, Geert Uytterhoeven <geert+renesas@glider.be>

Dne 2.7.2015 v 11:18 Geert Uytterhoeven napsal(a):
> On Thu, Jul 2, 2015 at 9:17 AM, Michal Marek <mmarek@suse.cz> wrote:
>> Dne 2.7.2015 v 08:47 Geert Uytterhoeven napsal(a):
>>> On Thu, Jul 2, 2015 at 2:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>> diff --cc scripts/kconfig/Makefile
>>>> index f52abae0ec5f,930de225d52e..000000000000
>>>> --- a/scripts/kconfig/Makefile
>>>> +++ b/scripts/kconfig/Makefile
>>>> @@@ -142,9 -139,9 +143,10 @@@ help
>>>>         @echo  '  alldefconfig    - New config with all symbols set to default'
>>>>         @echo  '  randconfig      - New config with random answer to all options'
>>>>         @echo  '  listnewconfig   - List new options'
>>>> -       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their default value'
>>>> +       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their'
>>>> +       @echo  '                    default value'
>>>>  -      @echo  '  kvmconfig       - Enable additional options for guest kernel support'
>>>>  +      @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>>>>  +      @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>>>
>>> Doh, a new long line to be wrapped.
>>>
>>> Michal: Shall I send a fix-up patch, or a new one against Linus' tree?
>>
>> Please send one against Linus' tree, because I do not have the xenconfig
>> patch in the kbuild tree.
> 
> Done.

Sorry, I misunderstood you. Please send a fix-up (i.e. just fixing the
new long line) patch based on Linus's tree.

Michal
