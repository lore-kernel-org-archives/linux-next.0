From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH] Revert "kconfig: Temporarily disable dependency warnings"
Date: Thu, 25 Nov 2010 13:09:46 -0500
Message-ID: <AANLkTik-vnDTRTshpXE7ufjCM9AcfLGQV5v9CcjV=zJx@mail.gmail.com>
References: <20101011145930.11fe570c.randy.dunlap@oracle.com>
	<1286889586-13483-1-git-send-email-mmarek@suse.cz>
	<20101029113731.5c7c54b9.sfr@canb.auug.org.au>
	<20101122114801.2eee4c4d.sfr@canb.auug.org.au>
	<AANLkTikwxBZUupGNA-gsrxWYpyCKK7wiVZu82WaUST-K@mail.gmail.com>
	<20101122135715.121b5eb7.sfr@canb.auug.org.au>
	<AANLkTi=io3tsuL8Hd2a0y8PyBYYAzb-gkJo1GfmpcF+L@mail.gmail.com>
	<AANLkTi=eTvdfPjgd0pGVmBx6zCB8yL3qNVq0MR1wH88b@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=eTvdfPjgd0pGVmBx6zCB8yL3qNVq0MR1wH88b@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Michal Marek <mmarek@suse.cz>, randy.dunlap@oracle.com, linux-kbuild@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, xiyou.wangcong@gmail.com, Mauro Carvalho Chehab <mchehab@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi,

On Thu, Nov 25, 2010 at 12:43 PM, Catalin Marinas
<catalin.marinas@arm.com> wrote:
> Now, commenting on your patches, you added a new statement, 'visible
> if...' for menus. Can we not change it to something like:
>
> -menu "I2C Algorithms"
> - =A0 =A0 =A0 depends on !I2C_HELPER_AUTO
> +menu "I2C Algorithms" if !I2C_HELPER_AUTO
>
no because if_expr are translated internally in term of dependency,
which we don't want.

 - Arnaud
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
