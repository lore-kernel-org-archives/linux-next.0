Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997081F5858;
	Tue, 27 Jan 2026 02:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769479798; cv=none; b=izgW/JFIFBKmVxam+3CF0+n5hBfrnURD6NlZ597wQlTlc7BSaj4iSvBZ3L6KDx9F6Oz2V9F+xZMbgIkrr/I5bprZbaWSPkiFyEfBatQCIsVGAZZLEqd3l07KnfbXD75pvMwBfmZ3mNz90y+Ixvcf5SLDiQWUNWUqBIGPXQz5uIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769479798; c=relaxed/simple;
	bh=Osmfo+MIqAdMbnUgZCe6SI2z+gGdIieo1OBlsSNeroU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fY2m66FD1ZHx6jJFjXPazipnwvqK7cr7kHJ1xSxI4ZHHFkh/x9HV56cUOEfCUrN5xmNS49hRymQL4UNrtJZDHIRCE7Hb5B89KVCls73MNivyWVa1sQWkrVbvcdy7OEJCRkq1IzvjdwxGxfXrW8YBrFn2/SmotGydLKioP3iknOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OowC8toZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OowC8toZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D433C116C6;
	Tue, 27 Jan 2026 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769479798;
	bh=Osmfo+MIqAdMbnUgZCe6SI2z+gGdIieo1OBlsSNeroU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OowC8toZywiGtsXaHJZ444LOHPAb50Ok7SfmSV+K4o0ITsV+wffiQuwihPa9rgenc
	 qDgN6WUnR53YFURpdgi5ZJaLOGzHggC6q4fV3jcgPL54WOo2UUnSSibu+6lE52hWhL
	 5DpBYehRldZIhYJbqSmKDTMI3tpvnnSyTFDqRQAbd8LDR8IBACiZtZUKANv6iepF+T
	 /o/gYNuF/mRjxYfoTsG/lwAQ5ERD6WfLTJ6lgQXve/sgKxvPr0TMddQh0nluJVcKfb
	 TbTB7LrbxRFjOG67AejEt5uEaErnKJNXn9BXcLZN4cEotaFVEC29QNBQZUXvK8MFsk
	 ME9ebxPud0KGQ==
Message-ID: <74c0bf0c-1a7e-41aa-a9d5-2b7d8f4275e1@kernel.org>
Date: Tue, 27 Jan 2026 11:09:56 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the scsi-mkp tree with the libata
 tree
To: Mark Brown <broonie@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Bart Van Assche <bvanassche@acm.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aXfldIKLh35dGHjN@sirena.org.uk>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <aXfldIKLh35dGHjN@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/27/26 07:06, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>   drivers/ata/libata.h
> 
> between commit:
> 
>   0ea84089dbf62 ("ata: libata-scsi: avoid Non-NCQ command starvation")
> 
> from the libata tree and commit:
> 
>   0db3f51839fe7 ("scsi: Change the return type of the .queuecommand() callback")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Mark,

Thank you for the fix. It looks good.

Martin,

What do you want to do ? I can rebase the 2 ata patches involved with this
conflict and you can take them in the scsi tree (that should not generate
another conflict with libata). Or we just leave this as is and sync up our PRs
for 6.20 so that Linus is notified of the conflict by one of us ?

> 
> diff --cc drivers/ata/libata.h
> index 9b4e578ad07ec,0e48bd1c0c206..0000000000000
> --- a/drivers/ata/libata.h
> +++ b/drivers/ata/libata.h
> @@@ -165,9 -164,8 +165,10 @@@ extern int ata_scsi_user_scan(struct Sc
>   void ata_scsi_sdev_config(struct scsi_device *sdev);
>   int ata_scsi_dev_config(struct scsi_device *sdev, struct queue_limits *lim,
>   		struct ata_device *dev);
> - int __ata_scsi_queuecmd(struct scsi_cmnd *scmd, struct ata_device *dev);
> + enum scsi_qc_status __ata_scsi_queuecmd(struct scsi_cmnd *scmd,
> + 					struct ata_device *dev);
>  +void ata_scsi_deferred_qc_work(struct work_struct *work);
>  +void ata_scsi_requeue_deferred_qc(struct ata_port *ap);
>   
>   /* libata-eh.c */
>   extern unsigned int ata_internal_cmd_timeout(struct ata_device *dev, u8 cmd);


-- 
Damien Le Moal
Western Digital Research
