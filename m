Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=schauer.dev header.i=@schauer.dev header.b="Y8iSOipA"
X-Greylist: delayed 480 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 03 Dec 2023 14:48:48 PST
Received: from mail.as62269.net (mail.as62269.net [IPv6:2a11:5b00::14])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E168EC8;
	Sun,  3 Dec 2023 14:48:48 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C6B5185FC7;
	Sun,  3 Dec 2023 23:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schauer.dev; s=dkim;
	t=1701643246; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=m2SwH+2nTFJ8YYCU70R3/og5ethgEhS9ts+NdUG/DWU=;
	b=Y8iSOipAM+/DS+lqchgiwKUDDsnQRZ8TPS/y9E+mn/X+y1ewFkuGOzCzdf10peEWl3aw0k
	NPckhg4VBgN18jO2mBaj192Q4bCyfH4joWd2fkdeLIUiOtsf5WQN+uiAy0JuZZ9A+Kb357
	m9VwiF+/Nmx6sfkzYi8LnkOUnvymdSs=
Message-ID: <5b43d427-f24e-4625-95eb-87ef21452025@schauer.dev>
Date: Sun, 3 Dec 2023 23:40:41 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <brauner@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231204090139.03f0ddcc@canb.auug.org.au>
From: Lukas Schauer <lukas@schauer.dev>
In-Reply-To: <20231204090139.03f0ddcc@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hey there,

I'm not sure on how to proceed here since I've never submitted patches 
to the kernel.
Does this require additional input by me?

Anyway I'm fine with the changes made to my original patch and its 
inclusion in the kernel source.

Regards,
Lukas

On 12/3/23 23:01, Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>    348806de39e0 ("pipe: wakeup wr_wait after setting max_usage")
>
> is missing a Signed-off-by from its author.
>
