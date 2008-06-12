From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: acpi/cpus4096 merge conflict
Date: Thu, 12 Jun 2008 11:31:16 -0700
Message-ID: <48516B74.4070902@sgi.com>
References: <20080612135032.b5d0c684.sfr@canb.auug.org.au>	<alpine.LFD.1.10.0806120045320.12191@localhost.localdomain>	<20080612121824.GA26504@elte.hu> <20080613012544.b06605b7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.171.30]:56477 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754921AbYFLSbV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Jun 2008 14:31:21 -0400
In-Reply-To: <20080613012544.b06605b7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, Len Brown <lenb@kernel.org>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Stephen Rothwell wrote:
> Hi Ingo,
> 
> On Thu, 12 Jun 2008 14:18:24 +0200 Ingo Molnar <mingo@elte.hu> wrote:
>> * Len Brown <lenb@kernel.org> wrote:
>>
>>>> Today's linux-next merge of the acpi tree got a trivial conflict in
>>>> drivers/acpi/processor_throttling.c between commit
>>>> 141ad0688adb53094d6f75b39b4b3b0625de0e07 ("acpi: use performance variant
>>>> for_each_cpu_mask_nr") from the cpus4096 tree and commit
>>>> 08a4ab4a5fd58438840524ce22199c6bbd05816f ("ACPI: change processors from
>>>> array to per_cpu variable") from the acpi tree.
>>>>
>>>> It is just a context conflict and I did the obvious fixup.
>>> thanks.
>>>
>>> it would be ideal if the cpus4096 tree didn't scribble on drivers/acpi 
>>> -- though I don't know if partitioning those patches is practical.
>> well, it's a tree-wide API change and thus maintained in a separate 
>> tree.
> 
> Just a suggestion for next time (or this time if you don't mind a bit of
> rearrangement):
> 
> Having now settled the interface changes down you could submit a patch to
> Linus for his current tree that defines next_cpu_nr, cpus_weight_nr and
> for_each_cpu_mask_nr to be next_cpu, cpus_weight and for_each_cpu_mask
> respectively (just as they still will be for NR_CPUS <= 64).  Once that
> has gone in (and I see no reason it wouldn't) you can send the patches
> that only depend on those three interfaces existing to their respective
> subsystem maintainers who will be now be able to apply them to their own
> trees (maybe after merging in Linus' tree).
> 
> This way I don't have ongoing manual merges to do in the -next tree and
> life is easier all round when we come to the next merge window at which
> point the actual new implementations can go in.
> 
> This has been partially done (and more is being done) with dev_name() and
> dev_set_name().
> 

Sounds like a good idea ... I'll try to restructure future patches so the
common code can be pushed separately and has minimal effect on the base code.
Are there any git options to add a "dependency check" to insure that parent
patches are in place?

Thanks,
Mike
