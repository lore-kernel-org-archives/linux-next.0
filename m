From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] mfd: fix modular builds of rc5t583 regulator support
Date: Mon, 16 Apr 2012 19:32:55 +0530
Message-ID: <4F8C268F.9080608@nvidia.com>
References: <1334549301-32114-1-git-send-email-paul.gortmaker@windriver.com> <4F8BC20A.2090105@nvidia.com> <4F8C28C5.9070308@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:14970 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753801Ab2DPOP2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 16 Apr 2012 10:15:28 -0400
In-Reply-To: <4F8C28C5.9070308@windriver.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "sameo@linux.intel.com" <sameo@linux.intel.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

On Monday 16 April 2012 07:42 PM, Paul Gortmaker wrote:
> On 12-04-16 02:54 AM, Laxman Dewangan wrote:
>> On Monday 16 April 2012 09:38 AM, Paul Gortmaker wrote:
>>
> As I said in the commit log, it doesn't seem to make sense to export
> them when they are trivial enough to be static inline, since it
> avoids having them pollute the /proc/kallsyms namespace.
>
> It is almost like having basic inb/outb as functions vs inline; it
> just doesn't make sense to me.
>
> However, if you are determined to rewrite the patch in another way,
> please add the customary reported-by line.
>

I am fine on either way i.e. inline or exporting symbols only.
