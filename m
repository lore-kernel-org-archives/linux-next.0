From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: linux-next: manual merge of the opp tree with the cpufreq-arm
 tree
Date: Thu, 7 Feb 2019 10:06:47 +0530
Message-ID: <20190207043647.qc6kxeigxytts5nu@vireshk-i7>
References: <20190207114726.741da653@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207114726.741da653@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Taniya Das <tdas@codeaurora.org>
List-Id: linux-next.vger.kernel.org

On 07-02-19, 11:47, Stephen Rothwell wrote:
> Hi Viresh,
> 
> Today's linux-next merge of the opp tree got a conflict in:
> 
>   drivers/cpufreq/qcom-cpufreq-hw.c
> 
> between commit:
> 
>   5471b2c9bd08 ("cpufreq: qcom: Read voltage LUT and populate OPP")
> 
> from the cpufreq-arm tree and commit:
> 
>   597457d7e054 ("cpufreq: qcom-hw: Register an Energy Model")
> 
> from the opp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/cpufreq/qcom-cpufreq-hw.c
> index 15f31e8c09c2,a16b9dca7ea3..000000000000
> --- a/drivers/cpufreq/qcom-cpufreq-hw.c
> +++ b/drivers/cpufreq/qcom-cpufreq-hw.c
> @@@ -224,13 -205,8 +224,15 @@@ static int qcom_cpufreq_hw_cpu_init(str
>   		goto error;
>   	}
>   
>  +	ret = dev_pm_opp_get_opp_count(cpu_dev);
>  +	if (ret <= 0) {
>  +		dev_err(cpu_dev, "Failed to add OPPs\n");
>  +		ret = -ENODEV;
>  +		goto error;
>  +	}
>  +
> + 	dev_pm_opp_of_register_em(policy->cpus);
> + 
>   	policy->fast_switch_possible = true;
>   
>   	return 0;

Thanks, I have taken care of it now. You shouldn't see it anymore.

-- 
viresh
