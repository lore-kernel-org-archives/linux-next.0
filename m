From: Kevin Hilman <khilman@deeprootsystems.com>
Subject: Re: linux-next: manual merge of the sound tree with the davinci tree
Date: Thu, 23 Jul 2009 10:54:44 -0700
Message-ID: <873a8ni8t7.fsf@deeprootsystems.com>
References: <20090723112110.e42430e9.sfr@canb.auug.org.au>
	<s5hvdlkvsk6.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751798AbZGWSCQ@vger.kernel.org>
In-Reply-To: <s5hvdlkvsk6.wl%tiwai@suse.de> (Takashi Iwai's message of "Thu\, 23 Jul 2009 08\:09\:45 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Takashi Iwai <tiwai@suse.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chaithrika U S <chaithrika@ti.com>, Pavel Kiryukhin <pkiryukhin@ru.mvista.com>, Naresh Medisetty <naresh@ti.com>, Steve Chen <schen@mvista.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Sudhakar Rajashekhara <sudhakar.raj@ti.com>
List-Id: linux-next.vger.kernel.org

Takashi Iwai <tiwai@suse.de> writes:

> At Thu, 23 Jul 2009 11:21:10 +1000,
> Stephen Rothwell wrote:
>> 
>> Hi Takashi,
>> 
>> Today's linux-next merge of the sound tree got a conflict in
>> sound/soc/davinci/davinci-evm.c between commit
>> 95d0d986d09ac25a5b9f2bf28f289ab0823e86d5 ("davinci: EDMA: multiple CCs,
>> channel mapping and API changes") from the davinci tree and commit
>> 04f80f5c486b39446af44e218dba90ec210d61ca ("ASoC: Add machine driver
>> support for DM646x") from the sound tree.
>> 
>> The latter removes the code modified by the former.  I have just used the
>> latter.
>
> Thanks.  I'll try to resolve the conflict in the sound tree,
> e.g. pulling the affecting commit of davinci tree into for-next 
> branch.

I've taken care of this in the DaVinci for-next branch.

I dropped the davinci changes that change code that were then dropped
by the asoc changes.

Kevin
