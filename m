Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6D33B3891;
	Wed,  3 Jun 2026 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491378; cv=none; b=o5TZ0E5BTfiYGx2w7rHn6aXYv4LxmRmdF5GCK8TI6c8QWYnWTS28Pf72Rr2qxSIuRzBxqMVETXvrz3/c+drNHhPtYGhFbAiz5BYSwbMNyoFPaCAtSjGfDirF0uSS+EmzOAwW0g6dZralbB1IZQXepi0eDM7YaBmFiQ7//DH410w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491378; c=relaxed/simple;
	bh=fIK8iOn64AdQMhZB3wxP7M3eVwlWA+nqDTlVxTd6UYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YlsHaFdPHwqHFbl9CKCe2oHJ5PiYOmHcNHEnItRvhGXZUpjx0xaBhGCjVpkR4OArgSvkomJdmfHtLa3DoAEEHUAHf/2geZ4MUIQNY3kWeLOp+odBc46VBcZZ/tj+gnVmuhK0/BNsbNu7KRXWCKsMBMih/4RLpF5E/+vc2qHVQHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9726f4fa5f4b11f1aa26b74ffac11d73-20260603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:1062ce17-fc32-4b6f-9e23-5fdb8a5006b4,IP:10,
	URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:5
X-CID-INFO: VERSION:1.3.12,REQID:1062ce17-fc32-4b6f-9e23-5fdb8a5006b4,IP:10,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3a3a40d5e2053a73467e2c0acf460b7e,BulkI
	D:260603205610MB7PJ38F,BulkQuantity:0,Recheck:0,SF:10|38|64|66|78|80|81|82
	|83|102|127|136|841|850|865|898,TC:nil,Content:0|15|52,EDM:-3,IP:-2,URL:99
	|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9726f4fa5f4b11f1aa26b74ffac11d73-20260603
X-User: tanze@kylinos.cn
Received: from [127.0.0.1] [(116.128.244.169)] by mailgw.kylinos.cn
	(envelope-from <tanze@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 377600020; Wed, 03 Jun 2026 20:56:08 +0800
Message-ID: <1b9a93f4-f9f7-48a5-9a2c-d8370ae5aeba@kylinos.cn>
Date: Wed, 3 Jun 2026 20:55:45 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the nfsd tree
To: Mark Brown <broonie@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Christian Brauner <brauner@kernel.org>, Steve French <stfrench@microsoft.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ChenXiaoSong <chenxiaosong@chenxiaosong.com>
References: <ah_kp-LWg7pndPkq@sirena.org.uk>
Content-Language: en-US
From: tanze <tanze@kylinos.cn>
In-Reply-To: <ah_kp-LWg7pndPkq@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steve, Mark,

Thanks for your suggestions.

Based on commit e50bc12f5a365 (cifs: Implement fileattr_get for case 
sensitivity),

I have added the following patch:

https://github.com/shepardtanze/smb-work/blob/main/test-patch/v1-0001-smb-client-revalidate-attrs-before-reporting-FS_C.patch

Please let me know if you have any thoughts or feedback on this.


在 2026/6/3 16:24, Mark Brown 写道:
> Hi all,
>
> After merging the nfsd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> ld.lld: error: duplicate symbol: cifs_fileattr_get
>>>> defined at cifsfs.c
>>>>             fs/smb/client/cifsfs.o:(cifs_fileattr_get)
>>>> defined at inode.c
>>>>             fs/smb/client/inode.o:(.text+0x14780)
> Caused by commit
>
>    e50bc12f5a365 (cifs: Implement fileattr_get for case sensitivity)
>
> interacting with
>
>    4adb7181f4d80 (smb: client: implement fileattr_get to support FS_IOC_GETFLAGS)
>
> from the cifs tree.  I have applied a revert of the latter purely
> because it is the most recent of the two commits and doing so fixes the
> build but I do not think this is the best fix, it looks like we need a
> merge of the two (eg, adding cifs_revalidate_dentry_attr() to the nfsd
> version).
