From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of the kbuild tree with Linus' tree
Date: Fri, 3 Jul 2015 13:56:17 +0200
Message-ID: <CAMuHMdWF2ZESr=uui1+25yYi84CTi+wF2W066nhRBessEpYOPg@mail.gmail.com>
References: <20150702103025.634ca1e5@canb.auug.org.au>
	<CAMuHMdUCu7MWiUGW+TmVN8=T8SvPHgUoupSdf9XMn0e1mKQm3Q@mail.gmail.com>
	<5594E56E.7080605@suse.cz>
	<CAMuHMdW7bn+jCRaL0xWG7WrVLmOsdmRgYj5F4r73vi2q3pL-Cg@mail.gmail.com>
	<559596CD.6000403@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36843 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755181AbbGCL4S (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 3 Jul 2015 07:56:18 -0400
In-Reply-To: <559596CD.6000403@suse.cz>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Luis R. Rodriguez" <mcgrof@suse.com>, David Vrabel <david.vrabel@citrix.com>, Geert Uytterhoeven <geert+renesas@glider.be>

On Thu, Jul 2, 2015 at 9:53 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 2.7.2015 v 11:18 Geert Uytterhoeven napsal(a):
>> On Thu, Jul 2, 2015 at 9:17 AM, Michal Marek <mmarek@suse.cz> wrote:
>>> Dne 2.7.2015 v 08:47 Geert Uytterhoeven napsal(a):
>>>> On Thu, Jul 2, 2015 at 2:30 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>> diff --cc scripts/kconfig/Makefile
>>>>> index f52abae0ec5f,930de225d52e..000000000000
>>>>> --- a/scripts/kconfig/Makefile
>>>>> +++ b/scripts/kconfig/Makefile
>>>>> @@@ -142,9 -139,9 +143,10 @@@ help
>>>>>         @echo  '  alldefconfig    - New config with all symbols set to default'
>>>>>         @echo  '  randconfig      - New config with random answer to all options'
>>>>>         @echo  '  listnewconfig   - List new options'
>>>>> -       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their default value'
>>>>> +       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their'
>>>>> +       @echo  '                    default value'
>>>>>  -      @echo  '  kvmconfig       - Enable additional options for guest kernel support'
>>>>>  +      @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>>>>>  +      @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>>>>
>>>> Doh, a new long line to be wrapped.
>>>>
>>>> Michal: Shall I send a fix-up patch, or a new one against Linus' tree?
>>>
>>> Please send one against Linus' tree, because I do not have the xenconfig
>>> patch in the kbuild tree.
>>
>> Done.
>
> Sorry, I misunderstood you. Please send a fix-up (i.e. just fixing the
> new long line) patch based on Linus's tree.

Done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
