From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH] Fix build failure when CONFIG_NLS is set to 'm' by allmodconfig
Date: Fri, 14 Jan 2011 16:29:42 +0100
Message-ID: <AANLkTimba7FFowzVV6KxwvXGis4d0FmxcxZA6NL0saNM@mail.gmail.com>
References: <20110112203414.GA5657@fedora14-r610.oslab.blr.amer.dell.com>
	<20110112160229.7b8d82c1@jbarnes-desktop>
	<alpine.LFD.2.02.1101122217370.19754@x980>
	<20110113075556.789ac3c3@jbarnes-vaio.home>
	<20110113162755.GA5872@fedora14-r610.oslab.blr.amer.dell.com>
	<20110114154458.GA18289@fedora14-r610.oslab.blr.amer.dell.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:59047 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752393Ab1ANP3n convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 14 Jan 2011 10:29:43 -0500
In-Reply-To: <20110114154458.GA18289@fedora14-r610.oslab.blr.amer.dell.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Narendra_K@dell.com
Cc: jbarnes@virtuousgeek.org, lenb@kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, sfr@canb.auug.org.au, Matt_Domsch@dell.com, Charles_Rose@dell.com, Surya_Prabhakar@dell.com

On Fri, Jan 14, 2011 at 4:22 PM,  <Narendra_K@dell.com> wrote:
> On Thu, Jan 13, 2011 at 09:33:56PM +0530, K, Narendra wrote:
>> On Thu, Jan 13, 2011 at 09:25:56PM +0530, Jesse Barnes wrote:
>> > On Wed, 12 Jan 2011 22:23:55 -0500 (EST)
>> > Len Brown <lenb@kernel.org> wrote:
>> > > > So there's no other ACPI code that depends on this function? =C2=
=A0I'd hate
>> > > > to make PCI depend on NLS, so assuming ACPI doesn't need it (i=
n which
>> > > > case the select or depend should be there), I guess it should =
be pulled
>> > > > into a common file that will always be included.
>> > >
>> > > No, nothing in the ACPI code uses utf16s_to_utf8s.
>> > >
>> > > I don't know anything about NLS, but it appears to be
>> > > something that file systems (befs, cifs, fat, hfs, isofs, jfs, e=
tc)
>> > > use to to support native languages.
>> > >
>> > > BTW. I don't understand why pci-label.o appears twice above.
>> > > It used to be just the 2nd one, that depends on CONFIG_DMI.
>> >
>> > Ok, I'll drop this patch for now then since I haven't seen a fix y=
et
>> > and need to get Linus the rest of the changes.
>>
>> Jesse,
>>
>> I just compile tested a fix on the following lines without any failu=
re.
>> If it is acceptable, i will send a patch in half an hour. It builds
>>
>
> Hello,
>
> This patch addresses the build failure described in this thread by
> compiling fs/nls/nls_base.c always into vmlinux, thus making the base
> nls functions available always.
>
> Please consider this patch for inclusion if there are no concerns wit=
h
> this approach.
>

So NLS is built always?
You thought of embedded devices like router platforms which want to
reduce their kernel (size) by not building NLS?

- Sedat -
