From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH] tpm: Fix compilation warning when CONFIG_PNP is not defined
Date: Mon, 18 Jul 2011 08:00:09 -0400
Message-ID: <4E242049.1030604@linux.vnet.ibm.com>
References: <1310903758.15064.9.camel@d941e-10> <20110718091624.bd262188190c5d7a05416b99@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110718091624.bd262188190c5d7a05416b99@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: rdunlap@xenotime.net, Rajiv Andrade <srajiv@linux.vnet.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On 07/17/2011 07:16 PM, Stephen Rothwell wrote:
> Hi Stefan,
>
> On Sun, 17 Jul 2011 07:55:58 -0400 Stefan Berger<stefanb@linux.vnet.ibm.com>  wrote:
>> The is_itpm() function is only accessed from a block surrounded by
>> #ifdef CONFIG_PNP. Therefore, also surround it with #ifdef CONFIG_PNP
>                  ^^^
>
>> --- linux-2.6.orig/drivers/char/tpm/tpm_tis.c
>> +++ linux-2.6/drivers/char/tpm/tpm_tis.c
>> @@ -80,7 +80,7 @@ enum tis_defaults {
>>   static LIST_HEAD(tis_chips);
>>   static DEFINE_SPINLOCK(tis_lock);
>>
>> -#ifdef CONFIG_ACPI
>> +#ifdef CONFIG_PNPN
>                   ^^^^
> Is this a typo?
>
Argh, yes.

    Stefan
