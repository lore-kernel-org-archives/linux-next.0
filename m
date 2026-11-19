Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090293;
	b=W+D6SDo7IdZVmKdCs4crSsICoajQPYlrwqYU6jHJWpp/25+7xUddREVWBB7G8il3MA5J
	 GiT2R/jQj25m+eOcjMwxCbuIq8WDLWWGL6mDwF+4VsPklzBkWcmRd1VmjhvHT5jDAMjtF
	 AcncBX2CZiM5l1HG5/gJXXwbkrmgug84s9HKcsSNcGbSJqlYPdDU5NkB7hFBtqlmc7nsa
	 a7taJVKxjw8iaY78mDu1xLirsunLCHFYa5SEdRz3NCmGIHibuqb+/jC08w8/jFHjOpG62
	 i5VtM9qrj2Opd6rvQCRqRzNya417LET1mZ+0SiLpPX5e2bH/aSYjIvSHKC6AVyyp1Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090293;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bWQoRGGfFy9Fp87cY30R3nqFopTr5reoFkNLZDHml+E=;
	b=1RWvleltl1i55Ozu7zL6fhjvFo/dOwt+9bPL0vZnYv6VdwnujefDWJrfd8rrOIe/9JdG
	 SCIu2UbtlTYIfIfnQ7FNefNI94pi/zPwEGBRT8UgOpdkEWEgGFXfJKPIwpaIbk08+NfD3
	 0s2zDANNg0LnWxk1I7VaLcI8nmTn2lbM2ofTyiOYTQQ0ixcPclTWSe5sztT/ZH6SH7PNt
	 8EqU76bnOo5PwNzAA4WUfwZ6vrlHYZafgcMwNSHn8ip0o5NQUOUu1SFLAAU8o3WD/2vlq
	 pv8mImDk/fPSCHp/ok1kip1jUQU4hiePMdc/SUdl+B29Ej9DJWh4bygXEt/wa9te8tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4DQc6GE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D526606A324;
	Thu, 19 Nov 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e4DQc6GE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5FC1F000C7;
	Thu, 19 Nov 2026 12:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795090292;
	bh=bWQoRGGfFy9Fp87cY30R3nqFopTr5reoFkNLZDHml+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e4DQc6GETIgysyie02X51AQjQB+A4diM6jRvV/PuZtwbe9YEQTPAoi6aa5sjYHnPa
	 c8QZ+9uPXcooQoIvcztlnji85ZweXUKR3xu5VmGoksBGie0jeaXHHAxu619xRa3gIZ
	 9fM0fIq6Ozu8hEd5CdlhMaxYIt5bWvMhz3n/b+OUlbJW6reWxdfMPsLctJFtf0ZL/a
	 B5smby62Jwd3Ewq5xp0pcLY6mA1DpkastStFdbKpbAYilIbEkp2v4un2TSxb2oDfrs
	 BPjgOmoC5AhMm1SctMxEnGMIJk/fNqP62GZ8uwm8hchs2A/kiHM1VutQwKNv9jhdkf
	 puXlH35/s5jqw==
Date: Thu, 19 Nov 2026 13:11:28 +0100
From: Christian Brauner <brauner@kernel.org>
To: Mark Brown <broonie@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
Cc: Chi Zhiling <chizhiling@kylinos.cn>, 
	Joanne Koong <joannelkoong@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the exfat tree with the origin tree
Message-ID: <20261119-offiziell-material-fallobst-7841054be9a3@brauner>
References: <av2oK6fn2XToTjxV@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <av2oK6fn2XToTjxV@sirena.org.uk>

On Wed, Nov 18, 2026 at 01:29:15PM +0000, Mark Brown wrote:
> from the exfat tree.  This one really wants some double checking.

Thanks for fixing this up. exfat_fallback_buffered_write() needs to keep
the exfat side. The rest looks right to me. There's a small fixup needed
on top of your resolution:

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -995,8 +995,8 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 	inode_dio_wait(file_inode(iocb->ki_filp));
 
 	written = iomap_file_buffered_write(&buffered, &source, exfat_write_iomap_next,
-			NULL, NULL);
-	if (written < 0)
+			&exfat_iomap_write_ops, NULL);
+	if (written <= 0)
 		return written;
 
 	end = buffered.ki_pos - 1;

Thanks!

-- 
