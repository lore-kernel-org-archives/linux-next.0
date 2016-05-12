From: Borislav Petkov <bp@suse.de>
Subject: Re: next: Crashes in x86 images due to 'locking/rwsem, x86: Clean up
 ____down_write()'
Date: Thu, 12 May 2016 15:51:31 +0200
Message-ID: <20160512135131.GA7803@pd.tnic>
References: <57348665.3050301@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:35431 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751940AbcELNvh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 May 2016 09:51:37 -0400
Content-Disposition: inline
In-Reply-To: <57348665.3050301@roeck-us.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Ingo Molnar <mingo@kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 12, 2016 at 06:34:29AM -0700, Guenter Roeck wrote:
> Borislav,
>=20
> your patch 'locking/rwsem, x86: Clean up ____down_write()' causes var=
ious
> crashes in x86 qemu tests.

Thanks for the report, let me take a look.

@Ingo: can you please back this one out of the lineup for the merge
window until I've sorted out the issue?

Thanks.

--=20
Regards/Gruss,
    Boris.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Nort=
on, HRB 21284 (AG N=C3=BCrnberg)
--=20
