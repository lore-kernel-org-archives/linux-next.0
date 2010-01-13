From: Phillip Lougher <phillip.lougher@gmail.com>
Subject: Re: linux-next: Tree for January 12 (unlzo)
Date: Wed, 13 Jan 2010 00:26:56 +0000
Message-ID: <bffbecbb1001121626j61fab30aj87048a17a2b091ff@mail.gmail.com>
References: <20100112171739.2011a0eb.sfr@canb.auug.org.au>
	 <20100112083013.1dad8a8d.randy.dunlap@oracle.com>
	 <20100113102254.332dbf33.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f225.google.com ([209.85.220.225]:54534 "EHLO
	mail-fx0-f225.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751029Ab0AMA05 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 12 Jan 2010 19:26:57 -0500
In-Reply-To: <20100113102254.332dbf33.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, albin.tonnerre@free-electrons.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Phillip Lougher <phillip@lougher.demon.co.uk>

On Tue, Jan 12, 2010 at 11:22 PM, Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> Hi Randy,
>
> On Tue, 12 Jan 2010 08:30:13 -0800 Randy Dunlap <randy.dunlap@oracle.=
com> wrote:
>>
>> arch/x86/boot/compressed/../../../../lib/decompress_unlzo.c:53: erro=
r: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'parse_hea=
der'
>> arch/x86/boot/compressed/../../../../lib/decompress_unlzo.c:90: erro=
r: expected '=3D', ',', ';', 'asm' or '__attribute__' before 'unlzo'
>>
>> Problem is the "INIT" there, seems to be undefined.
>
> Caused by an interaction between Linus' tree and the squashfs tree th=
at
> is being worked on. =A0It should not occur with today's linux-next as=
 the
> squashfs changes have been removed pending a fix.

This problem is caused by the introduction of the unlzo code in Linus'
tree, and some patches in
the squashfs-next tree that move things out of
include/linux/decompress/mm.h into separate
xxx_mm.h files for each decompressor.  These parches were, obviously,
done before the unlzo
code was present.

I've fixed the patches in the squashfs-next tree for unlzo, and the
breakage should be fixed :-)

Thanks

Phillip
