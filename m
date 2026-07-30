Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690153502A5;
	Thu, 30 Jul 2026 17:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785432715; cv=none; b=kYrRTxxyZ+s+L3ooRbBdQbLNSQ9yuu8BxN6Im3ylV8tZxZVEHLuKf/x01OOKbCSPrwbM2ehB9cTMJC87KovOhgmDkcEYQTyOn6roUbcy2/d+gyP0k9YUxuhjK4AJrIldjbtcVKN0WawqJuinYEPjh37LMqXdBi7aVcCWumEBons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785432715; c=relaxed/simple;
	bh=tb9gjr4XBR5KRaI5HRzvJHsPGbcmzgomHzuZn+xb6Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFrKqP8TN2sWE4DPT98n+lc8xDf3fpVFOKP4C7xa1eVehq1jry/eZw2zA696bkfIvZOAZvl4FX/Rc56D3woiTEt2aePlGHpqvosWjqHl3HtKJGIhWVFXOhGwJg2SC4ehWiDsZ8kl8Gf+qdZ1yPFZmbEkdEqCzfpdJ/4/tbu3/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JsLSTGPc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JsLSTGPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9970D1F000E9;
	Thu, 30 Jul 2026 17:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785432713;
	bh=RFueAi8cbwU0Oem/qoNwoyO1tYJYtk++4AK0AFDrccQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=JsLSTGPcSX8u8YkY+Of8MLUiCFm4JYy04ysTr1WpUAiSjmBTwh8YlMKFi49FzHY9Y
	 1dotJqwU3o42oMvxJDdaeQSENfJ3qNY4/1lZjZTF+HUHizvjK/UwakXT4ttdfRLcWV
	 sC3wcPtFgWSnOofkaOcIrZH7tjTeADIYX3gVZyk1hBq/4nF97xgRJFHGOnPsfgtYSs
	 2BYYnakC9SxSh17urdyAiuTuSbBtIrNj0zqRQisv8ZLfeXpAKrsgaDNsWiJ1+hKIHg
	 s6pMwGyBty6Ep4HoPsSsSwtmHSmJQ5EiaB3iozXcORaB+tobttJrNRwB1tI/XwbJqp
	 sX42E6TL26hwA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 547DACE0B67; Thu, 30 Jul 2026 10:31:53 -0700 (PDT)
Date: Thu, 30 Jul 2026 10:31:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <cdc6cf4f-57b2-475d-b9d3-23c4693ed871@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <amth-CMf3Xz5hR32@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amth-CMf3Xz5hR32@sirena.org.uk>

On Thu, Jul 30, 2026 at 03:38:48PM +0100, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the slab tree got a conflict in:
> 
>   mm/slab_common.c
> 
> between commit:
> 
>   736084507faa3 ("rcu: Rename struct rcu_gp_oldstate to rcu_gp_seq")
> 
> from the rcu tree and commit:
> 
>   bdd0cc9f0ffc3 ("mm/slab: introduce struct kvfree_rcu_head for kvfree_rcu batching")
> 
> from the slab tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This resolution looks good to me, thank you!

							Thanx, Paul

> diff --cc mm/slab_common.c
> index 657fd75776ea7,b8f21eabcccc2..0000000000000
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@@ -1363,8 -1420,8 +1420,8 @@@ struct kvfree_rcu_bulk_data 
>   
>   struct kfree_rcu_cpu_work {
>   	struct rcu_work rcu_work;
> - 	struct rcu_head *head_free;
> + 	struct kvfree_rcu_head *head_free;
>  -	struct rcu_gp_oldstate head_free_gp_snap;
>  +	struct rcu_gp_seq head_free_gp_snap;
>   	struct list_head bulk_head_free[FREE_N_CHANNELS];
>   	struct kfree_rcu_cpu *krcp;
>   };
> @@@ -1569,10 -1626,10 +1626,10 @@@ static void kfree_rcu_work(struct work_
>   	unsigned long flags;
>   	struct kvfree_rcu_bulk_data *bnode, *n;
>   	struct list_head bulk_head[FREE_N_CHANNELS];
> - 	struct rcu_head *head;
> + 	struct kvfree_rcu_head *head;
>   	struct kfree_rcu_cpu *krcp;
>   	struct kfree_rcu_cpu_work *krwp;
>  -	struct rcu_gp_oldstate head_gp_snap;
>  +	struct rcu_gp_seq head_gp_snap;
>   	int i;
>   
>   	krwp = container_of(to_rcu_work(work),


