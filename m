From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: build failure after merge of the pm tree
Date: Mon, 14 Jan 2013 14:22:20 +0100
Message-ID: <CA+icZUX7O6bAzSL_ysSum2psQC0M3K2EE5QUYL68F62vSsKfrA@mail.gmail.com>
References: <20130114110311.a399f92e5e4ec730b380eaf4@canb.auug.org.au>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qc0-f169.google.com ([209.85.216.169]:39641 "EHLO
	mail-qc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756189Ab3ANNWV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 14 Jan 2013 08:22:21 -0500
In-Reply-To: <20130114110311.a399f92e5e4ec730b380eaf4@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 14, 2013 at 1:03 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Rafael,
>
> After merging the pm tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from init/main.c:25:0:
> include/linux/acpi.h:549:46: error: unknown type name 'acpi_handle'
> include/linux/acpi.h:551:49: error: unknown type name 'acpi_handle'
>
> and many more.
>
> Caused by commit c9b147cd9648 ("ACPI / PM: Rework the handling of devices
> depending on power resources").  Please check with and without CONFIG
> options that affect patches ...
>
> I have used the pm tree from next-20130111 for today.

[ Please also CC linux-next ML ! ]

[ QUOTE ]
Thanks for the report and sorry for the breakage.  Should be fixed now.

Rafael
[ /QUOTE ]

What was the cause for this?

Did you refresh "ACPI / PM: Rework the handling of devices depending
on power resources" [1]?

- Sedat -

[1] http://git.kernel.org/?p=linux/kernel/git/rafael/linux-pm.git;a=commitdiff;h=d99d400c824b008202e2b7b4bf2080cf5d18d601

> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
