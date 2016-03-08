From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: linux-next: manual merge of the watchdog tree with the arm-soc
 tree
Date: Tue, 8 Mar 2016 16:55:35 +0000
Message-ID: <56DF0407.7070508@arm.com>
References: <20160307150402.191ba735@canb.auug.org.au>
 <56DEF546.9090900@arm.com>
 <CADyBb7tUjFoV6HbJRnuvB1ZhJ8KXFsXzW66v1AaYc9+UyH4i8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:34854 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S933275AbcCHQzk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Mar 2016 11:55:40 -0500
In-Reply-To: <CADyBb7tUjFoV6HbJRnuvB1ZhJ8KXFsXzW66v1AaYc9+UyH4i8A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Fu Wei <fu.wei@linaro.org>, =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>



On 08/03/16 16:03, Fu Wei wrote:
> Hi All,
>
> On 8 March 2016 at 22:52, Andr=C3=A9 Przywara <andre.przywara@arm.com=
> wrote:

[...]

>
> I can rebase this patch to make a  watchdog DT patch for
> foundation-v8.dtsi ASAP.
>
> Thanks
>
>> If this is too much hassle I could also send a fix after -rc1 (as th=
e
>> breakage is not really critical).
>>

Thanks Andre and Fu Wei, I just fixed it myself and sent the PR[1]

--=20
Regards,
Sudeep

[1] http://www.spinics.net/lists/arm-kernel/msg489600.html
