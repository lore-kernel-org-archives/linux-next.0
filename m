From: Josh Boyer <jwboyer@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with the 4xx tree
Date: Thu, 1 Dec 2011 10:39:43 -0500
Message-ID: <CA+5PVA5Ww-_CHTaTLSVih9D6sihrD0TGwHGwGbG5-tDZPcer2w@mail.gmail.com>
References: <20111201131604.fa4e2fe14d5f370924592939@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:59706 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754766Ab1LAPjo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 1 Dec 2011 10:39:44 -0500
In-Reply-To: <20111201131604.fa4e2fe14d5f370924592939@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tanmay Inamdar <tinamdar@apm.com>, Paul Bolle <pebolle@tiscali.nl>

On Wed, Nov 30, 2011 at 9:16 PM, Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> Hi Jiri,
>
> Today's linux-next merge of the trivial tree got a conflict in
> arch/powerpc/platforms/40x/Kconfig between commit d5b9ee7b514e
> ("powerpc/40x: Add APM8018X SOC support") from the 4xx tree and commi=
t
> ff5f483f3091 ("powerpc: 4xx: remove commented out Kconfig entries") f=
rom
> the trivial tree.
>
> Just context changes. =A0I fixed it up (see below) and can carry the =
fix as
> necessary.

That seems correct to me.  If you don't mind carrying it, I'd appreciat=
e it.

josh
