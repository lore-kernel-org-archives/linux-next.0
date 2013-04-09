From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: Tree for Apr 9 [cpufreq: NULL pointer deref]
Date: Tue, 9 Apr 2013 20:26:42 +0530
Message-ID: <CAKohpok+9dRaENjBfnN9gZF3zvFU9v19xV_eFfcM3Pj6Cv=S2w@mail.gmail.com>
References: <CA+icZUU_K9PiFMqMsOEk1+c2DX8LrUojZptPiRVarv4dcB2qFA@mail.gmail.com>
	<31778276.CDMUtaAAnc@vostro.rjw.lan>
	<CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:34800 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761840Ab3DIO4n (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Apr 2013 10:56:43 -0400
Received: by mail-ob0-f178.google.com with SMTP id ni5so2489365obc.9
        for <linux-next@vger.kernel.org>; Tue, 09 Apr 2013 07:56:43 -0700 (PDT)
In-Reply-To: <CA+icZUXXHb9vmcNuFmYha34SV7xch2S8OcgZ+cLVVnNebs5pNQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Linux PM list <linux-pm@vger.kernel.org>

On 9 April 2013 19:34, Sedat Dilek <sedat.dilek@gmail.com> wrote:
> I have seen it on reboots.
> How to online/offline from sysfs?

offline a cpu "x" with:

echo 0 > /sys/devices/system/cpu/cpux/online

and online with echo 1 > to same location.
