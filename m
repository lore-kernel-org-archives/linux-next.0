From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH] thermal: add missing HAS_IOMEM dependency for SPEAr13x
 thermal sensor driver
Date: Wed, 29 Feb 2012 13:53:42 -0500
Message-ID: <CAP=VYLphmvMfYAoo5RJHR8FNzfd7NFcBNORxdW4BnoCKWqHLGw@mail.gmail.com>
References: <1330519212-7046-1-git-send-email-heiko.carstens@de.ibm.com>
	<4F4E336A.8050602@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:48832 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756683Ab2B2Sxn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 29 Feb 2012 13:53:43 -0500
Received: by pbcup15 with SMTP id up15so4907973pbc.19
        for <linux-next@vger.kernel.org>; Wed, 29 Feb 2012 10:53:42 -0800 (PST)
In-Reply-To: <4F4E336A.8050602@st.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vincenzo Frascino <vincenzo.frascino@st.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Viresh KUMAR <viresh.kumar@st.com>

On Wed, Feb 29, 2012 at 9:17 AM, Vincenzo Frascino
<vincenzo.frascino@st.com> wrote:
> Thanks Heiko,
>
> Il 29/02/2012 13:40, Heiko Carstens ha scritto:
>> Fix this build error on s390:
>>
>> drivers/thermal/spear_thermal.c: In function 'thermal_get_temp':
>> drivers/thermal/spear_thermal.c:49:2: error:
>> =A0 =A0implicit declaration of function 'readl' [-Werror=3Dimplicit-=
function-declaration]
>>
>> Cc: Vincenzo Frascino <vincenzo.frascino@st.com>
>> Cc: Viresh Kumar <viresh.kumar@st.com>
>> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
>> ---
>> =A0drivers/thermal/Kconfig | =A0 =A02 +-
>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
>> index 2633fe0..06101a7 100644
>> --- a/drivers/thermal/Kconfig
>> +++ b/drivers/thermal/Kconfig
>> @@ -21,7 +21,7 @@ config THERMAL_HWMON
>>
>> =A0config SPEAR_THERMAL
>> =A0 =A0 =A0 bool "SPEAr thermal sensor driver"
>> - =A0 =A0 depends on THERMAL
>> + =A0 =A0 depends on THERMAL && HAS_IOMEM

No, we dont need this.  The better patch was already posted:

   https://lkml.org/lkml/2012/2/26/155

I've tested the above "depends on PLAT_SPEAR" patch and
confirmed it fixes the s390 build failures that just appeared in
linux-next.  This is the patch we need in the akpm queue.

Thanks,
Paul.
--

>> =A0 =A0 =A0 help
>> =A0 =A0 =A0 =A0 Enable this to plug the SPEAr thermal sensor driver =
into the Linux
>> =A0 =A0 =A0 =A0 thermal framework
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@st.com>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-next"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
