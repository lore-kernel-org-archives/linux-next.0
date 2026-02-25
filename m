Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2418872A
	for <linux-next@vger.kernel.org>; Wed, 25 Feb 2026 04:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771993560; cv=none; b=S4KvzHkTCqxDmpIQCZNEN3EMcfj1oXwkdkBoqbQa0fBjBhax0FzZX6Ez8ajws9LTxxRItcr89JCgXmnr9n4bHQyhACmTlbdchcfONA7wlj0sQitRyrCike71Y7SOlETpNjCsa6VZ2vcIi334sQVzStiuWWBnkSdqNGAwdqkuw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771993560; c=relaxed/simple;
	bh=p6L0jynH6s14sdk8Fr7wxSNVC3rNT0Mg+S4pV49nhco=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Tuz+K6oiSXQRA15nO88G94aVWQ4Fw4AOZD2yzP6yNV7dATsUObgodJhBscGKtoArQYQunUYaEhSGThTiY2ulfny/0VkXsb2NkmlsRu+uiETetNM+ZFWnTMN7ntLEeF6PypmN9OoDXhAQ68xyCx02TFqVP/IyMpYcs9nLwghqtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWYyHn5k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWYyHn5k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32B90C116D0;
	Wed, 25 Feb 2026 04:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771993559;
	bh=p6L0jynH6s14sdk8Fr7wxSNVC3rNT0Mg+S4pV49nhco=;
	h=Date:To:Cc:From:Subject:From;
	b=GWYyHn5krh9T86YFcBvbxzjRyXkwvdg34PvOAw6vMJWixUAHJy2ea5RP+pSqV0kqu
	 vowzR34e1R5lGMHtksgOlZssmzgR8GJJz5XK11ONHdhmuaFXOmRkjDGHw5CLmVCape
	 9ZgdXjebcj2xzM3Qd7AA/aMRxafnRw48S44eaEmAHVjYZUUrQcBz7UZKLx2nxtDxhG
	 sukuT7+3l7uMgRdaAWTV/liJSUm+qNDh9pZKWd9BmMkEBeyUDyEE2UfRy1gxeaUD3j
	 ErO2q2swIFttfNbCXLV0bsZeBstWCixRK1+3mmB5wEsakopCEopOjOsheA5W32gXSa
	 RDB+KKc2CmpIA==
Message-ID: <537c455e-36bb-4f80-a910-10a58247a67d@kernel.org>
Date: Tue, 24 Feb 2026 22:25:58 -0600
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, broonie@kernel.org
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Include Altera's SoCFPGA tree
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi linux-next maintainers,

Could you please add the SoCFPGA tree to linux-next? The branch contains 
patches intended for the next merge window for the SoCFPGA subsystem.


Git Repo: https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git

Branch: for-next

Thanks,

Dinh Nguyen
