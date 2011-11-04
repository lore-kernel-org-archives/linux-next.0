From: Pekka Enberg <penberg@kernel.org>
Subject: Re: linux-next: Tree for Nov 3 (KVMTOOL_TEST_ENABLE)
Date: Fri, 4 Nov 2011 22:03:47 +0200
Message-ID: <CAOJsxLGnUk9NaV2dNZH3rOMaRcCvn7Hb6w=Gn_fq9eEv2NXQnA@mail.gmail.com>
References: <20111103172036.0795ce9559ab2dbfd5740a26@canb.auug.org.au>
	<4EB33525.808@xenotime.net>
	<4EB419F5.6070308@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:62686 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233Ab1KDUDs convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 4 Nov 2011 16:03:48 -0400
In-Reply-To: <4EB419F5.6070308@xenotime.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, x86 maintainers <x86@kernel.org>, Sasha Levin <levinsasha928@gmail.com>, Ingo Molnar <mingo@elte.hu>

On Fri, Nov 4, 2011 at 6:59 PM, Randy Dunlap <rdunlap@xenotime.net> wro=
te:
> On 11/03/2011 05:43 PM, Randy Dunlap wrote:
>> On 11/02/2011 11:20 PM, Stephen Rothwell wrote:
>>> Hi all,
>>
>>
>> When KVMTOOL_TEST_ENABLE is enabled but CONFIG_BLOCK is not enabled,=
 there are
>> MANY build errors. =A0This one (case) is probably fixed by adding "s=
elect BLOCK", but it's
>> all rather ugly.
>
> kconfig even tells us:
>
> warning: (KVMTOOL_TEST_ENABLE) selects KGDB which has unmet direct de=
pendencies (HAVE_ARCH_KGDB && DEBUG_KERNEL && EXPERIMENTAL)
> warning: (KVMTOOL_TEST_ENABLE) selects BLK_DEV which has unmet direct=
 dependencies (BLOCK)

Sasha, I guess your patch fixes this? Can you send me a version that
doesn't add the oldconfig magic that Ingo objected to?
