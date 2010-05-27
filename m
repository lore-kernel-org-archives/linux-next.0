From: Siarhei Liakh <sliakh.lkml@gmail.com>
Subject: Re: [PATCH 2/4] [tip:x86/mm] Set first MB as RW+NX
Date: Thu, 27 May 2010 12:58:13 -0400
Message-ID: <AANLkTilnr1yXcA_HAdKnlJwZZF6lb-mAoJSW9DXPMjUU@mail.gmail.com>
References: <AANLkTin1B96oeU50v0FPSJcVVFEKYos8-jM_i9eRiKxF@mail.gmail.com>
	<20100527095546.bb1bb941.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20100527095546.bb1bb941.randy.dunlap@oracle.com>
Sender: linux-security-module-owner@vger.kernel.org
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, Arjan van de Ven <arjan@infradead.org>, James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <ak@muc.de>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@elte.hu>, Rusty Russell <rusty@rustcorp.com.au>, Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
List-Id: linux-next.vger.kernel.org

On Thu, May 27, 2010 at 12:55 PM, Randy Dunlap <randy.dunlap@oracle.com=
> wrote:
> Hi,
>
>
> On Thu, 27 May 2010 12:52:21 -0400 Siarhei Liakh wrote:
>
>> diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
>> index 4814d35..6dbcb6f 100644
>> --- a/arch/x86/Kconfig.debug
>> +++ b/arch/x86/Kconfig.debug
>> @@ -123,6 +123,17 @@ config DEBUG_NX_TEST
>> =A0 =A0 =A0 =A0 =A0and the software setup of this feature.
>> =A0 =A0 =A0 =A0 =A0If in doubt, say "N"
>>
>> +config DEBUG_SET_1ST_MB_RWNX
>> + =A0 =A0 =A0 bool "Set 1st MB of kernel space mapping as RW+NX"
>> + =A0 =A0 =A0 default n
>> + =A0 =A0 =A0 depends on X86
>> + =A0 =A0 =A0 ---help---
>> + =A0 =A0 =A0 =A0 This option helps to catch unintended modification=
s/execution of
>> + =A0 =A0 =A0 =A0 1st megabyte of kernel address space. Such protect=
ion may interfere
>> + =A0 =A0 =A0 =A0 with run-time code patching and legacy BIOS servic=
es residing within
>> + =A0 =A0 =A0 =A0 the 1st MB of physical address space.
>> + =A0 =A0 =A0 =A0 If in doubt, say "N".
>
> Please spell out "first" instead of "1st" (all places in user-visible=
 text).
>
> and gmail is space-stuffing your patches (converting tabs to spaces).
> Not good. =A0Are you using the gmail web interface for patches?
> That won't work AFAIK. =A0You'll need to use a real mail client.

Will do.
Thanks.
--
To unsubscribe from this list: send the line "unsubscribe linux-securit=
y-module" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
