Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33763CD8D1
	for <linux-next@vger.kernel.org>; Fri, 10 Apr 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775836482; cv=none; b=NUU2SeCbKCHowjp55GaY6XAw6amm5hTouQuuD3RgUZLuMLfXg8JZ4dUmBNmi78vtECLH+PsUH9ns/NWsyYTyFFAwTeb0qD0OfVxf5tu9oF+vHMBRvfn7asLN0WNa52JKud6qXzBvSGLSgB7IPs5VIxfF+8b8sQR0KBufR/3rJgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775836482; c=relaxed/simple;
	bh=OZIU1Y4MomQJ987vOntp31KLQkBAsOAm9LHhp43YceM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rftQivlVdouH2GjmCa5tV/TviwJgPuvqeHT0NkNEZ4oLxIF8WnWPetux/X7y4uk5RWkbAclHGROFKz7eH6Q4OaBNTPiDbs1imbH1mDyK9rPoMD8zcu3OQZ4iiGtF961UyxsDGA2exSXR0dnI6CEGUcbzVsfumuALe72FFxEPZfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com; spf=pass smtp.mailfrom=chenxiaosong.com; dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b=KAec9rYt; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chenxiaosong.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chenxiaosong.com header.i=@chenxiaosong.com header.b="KAec9rYt"
Message-ID: <f2beb294-1fa3-4370-906b-570616fc4b88@chenxiaosong.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chenxiaosong.com;
	s=key1; t=1775836475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/CYxOQShb69JYEG7bBkVnYHOenjCGBPWYX4lmGZu/Q=;
	b=KAec9rYtn0T5NQRogDzWXkTnv+9DK4YF+6MUJpCJk4lYSHMilfZaxSiBbMH08SfVvDe+Va
	Tt3ZUPD0OWcWwWmT8FerTmXro5OvecSbdDQ1JJSi2MSyn4ibmXDn9u7E64j4mvNcxFM0mk
	2EqVBea62G7vNyqwjtKWDaCX5qPUc+VHE8PXzpA+alF5idKVGDBG/OCDAvUXYCW6egcGPF
	JGGbm+54kAMwmTdLeoRpkaa1Pjv3MDJc8VphRgL00h8Tl+1jIOkQdUi7tP646Jw8jbWV4p
	+Skci2YGzTptS1y2LZHTWRkQkfp6q/up15HdCBCs5FXI1Ur/c8NhdycvhY0+eQ==
Date: Fri, 10 Apr 2026 23:53:43 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] smb: client: add missing MODULE_DESCRIPTION() to
 smb1maperror_test
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, sfrench@samba.org,
 pc@manguebit.org
Cc: skb99@linux.ibm.com, maddy@linux.ibm.com, linux-cifs@vger.kernel.org,
 linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260410150247.93178-2-venkat88@linux.ibm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: ChenXiaoSong <chenxiaosong@chenxiaosong.com>
In-Reply-To: <20260410150247.93178-2-venkat88@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Looks good to me. Feel free to add:
Reviewed-by: ChenXiaoSong <chenxiaosong@kylinos.cn>

On 4/10/26 23:02, Venkat Rao Bagalkote wrote:
> On the latest linux-next following modpost warning is reported:
> 
>    WARNING: modpost: missing MODULE_DESCRIPTION() in
>    fs/smb/client/smb1maperror_test.o
> 
> Add MODULE_DESCRIPTION() to the test module to fix the warning.
> 
> Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> ---
> Changes in v3:
> - Update MODULE_DESCRIPTION as suggested in review
> 
>   fs/smb/client/smb1maperror_test.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/smb/client/smb1maperror_test.c b/fs/smb/client/smb1maperror_test.c
> index 820c0dd3bcce..2caaf11228ef 100644
> --- a/fs/smb/client/smb1maperror_test.c
> +++ b/fs/smb/client/smb1maperror_test.c
> @@ -74,3 +74,4 @@ static struct kunit_suite maperror_suite = {
>   kunit_test_suite(maperror_suite);
>   
>   MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("KUnit tests of SMB1 maperror");

-- 
ChenXiaoSong <chenxiaosong@kylinos.cn>
Chinese Homepage: chenxiaosong.com
English Homepage: chenxiaosong.com/en

