From: Piotr Hosowicz <piotr@hosowicz.com>
Subject: Re: Has somethimg changed in next's Debian package generation?
Date: Fri, 09 Jul 2010 16:32:10 +0200
Message-ID: <4C3732EA.7070105@example.com>
References: <4C31F5C0.2020106@example.com>
Reply-To: piotr@hosowicz.com
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-2;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 63.mail-out.ovh.net ([91.121.185.56]:39119 "HELO
	63.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1757016Ab0GIOcQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2010 10:32:16 -0400
In-Reply-To: <4C31F5C0.2020106@example.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: piotr@hosowicz.com
Cc: linux-next@vger.kernel.org

On 05.07.2010 17:09, Piotr Hosowicz wrote:
> Hello,
>
> I build the kernel with make-kpkg under debian like:
>
> make-kpkg kernel_image
>
> I have had done it this way also with linux next. Lacking fresh sourc=
es
> after a short break from next I tried to build today's next as always
> but the build failed when it was to finally build the package saying
> that there is a inconsisteny in control file. I tried to tinker a bit
> with ./debian/control but to no effect.
>
> Has something changed? It used to work just like that, there were no
> problems at all.

Anybody has any advice?

Thanks in advance.

Regards,

Piotr Hosowicz

--=20
"Pirotechnicy zdetonowali na warszawskim Ok=EAciu podejrzane =B3adunki,
znalezione przy porzuconym motocyklu. Wszystko wskazuje na to, =BFe
by=B3 to fa=B3szywy alarm". Z polskiego na nasze: "rozp* komu=B6 motor"=
=2E
NP: Mark Knopfler - Hard Shoulder
NB: 2.6.35-rc4-git4
