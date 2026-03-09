Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729F3CB2D2;
	Mon,  9 Mar 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075401; cv=none; b=fc2p6TolLUe2ufj4n0r2cB2lz8DuFbkRoLlw9cLiXhWQ0MrCmecl48hcP8KbytRCC1THxMjhhaMY55cXq3raF8mz4xQYd13dAZxGjBJmMMZq+NdqtDfghPT031AZr6pSDzH/+0nWR1cTR27lzy11PT2Or0AalzeAiayz3wx6sQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075401; c=relaxed/simple;
	bh=oreLvpP3KqwjHBSgmXvUN3dBCqDgRo7463OqR469AH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s3mmEVpdqRq/045y1pDve7zHmgIiOJwE7kjDSwLGvgqDKuA3UQynwG7iWGHO5ovkMIgL4vvq3kfEY5VTZamLuDM32CmcKAeZeg9RwKbjpEabFD+hJ83SHAnh5Z+tZfEpVbbH/gEbS8pt4fAMvxcTGOqJQZ7KHzgO6iw/PoER6/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwmlxMeJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwmlxMeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C14C4AF09;
	Mon,  9 Mar 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075401;
	bh=oreLvpP3KqwjHBSgmXvUN3dBCqDgRo7463OqR469AH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwmlxMeJ1hPMj5yx3+StjDA1NqujOY3envyooFcnjLSRhd9NY9AXB4BebfA2WI+/B
	 SPgeOQPfqi1BJbQ3nbYzatBlP5jZ0LParVKEpbE2wYXWaWM8UjT2bbV7RPa+irlO0c
	 guGeJSOArQ9FpC9Ww+mE1P8OMr1wcbrC6RdSVXftsO3aowq6HSswg+baujhVPc4Zu+
	 DTJMqxnrISOXNtAbjomVhUI+JfIjLD0Dd2bKjP2ESudM6esFrz3SHcexe84JhHBB6j
	 5B2vDMn3PMdbbOwFuJ9H82Py3BIbSMU7+5DeKKvv/lhLe2iE3w8t9SUvAoSlRmHTUE
	 tScXT41K/FK3Q==
Date: Mon, 9 Mar 2026 17:56:37 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the libata tree with the origin tree
Message-ID: <aa77xS2TewAwB3_N@ryzen>
References: <aa7uBn7h20yFEUF4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa7uBn7h20yFEUF4@sirena.org.uk>

On Mon, Mar 09, 2026 at 03:57:58PM +0000, Mark Brown wrote:

(snip)

> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/ata/libata-scsi.c
> index ad798e5246b49,4225c6d7ff359..0000000000000
> --- a/drivers/ata/libata-scsi.c
> +++ b/drivers/ata/libata-scsi.c
> @@@ -1694,15 -1697,10 +1697,11 @@@ void ata_scsi_requeue_deferred_qc(struc
>   	 * do not try to be smart about what to do with this deferred command
>   	 * and simply retry it by completing it with DID_SOFT_ERROR.
>   	 */
> - 	if (!qc)
> - 		return;
> - 
> - 	scmd = qc->scsicmd;
> - 	ap->deferred_qc = NULL;
> - 	cancel_work(&ap->deferred_qc_work);
> - 	ata_qc_free(qc);
> - 	scmd->result = (DID_SOFT_ERROR << 16);
> - 	scsi_done(scmd);
> + 	if (qc) {
> + 		ap->deferred_qc = NULL;
> ++		cancel_work(&ap->deferred_qc_work);
> + 		ata_scsi_qc_done(qc, true, DID_SOFT_ERROR << 16);
> + 	}
>   }
>   
>   static void ata_scsi_schedule_deferred_qc(struct ata_port *ap)

Hello Mark,

Your conflict resolution looks correct.

I decided to merge for-7.0-fixes branch into for-7.1 / for-next,
for simplicity.

This way, no need to bother Linus with a conflict resolution once
the merge window opens.

Thank you for the heads-up!


Kind regards,
Niklas
