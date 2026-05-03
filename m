Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE693D092D
	for <linux-next@vger.kernel.org>; Sun,  3 May 2026 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777832379; cv=none; b=MRyCI+bNzabE7CKjEMSLk5mHsqPStDetB600DX+RbK/NmggBD4x/0wS2OokDnLikermFAwyWM6Ab3x+U76rIMv4XGMO6cdxAqSg0JWI0zX+J5JJlKQYHRgGxrH9awp/CNg5l69ObqO4Hq0oHO80IjEvA0DhdA5qMmA63LCpnK5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777832379; c=relaxed/simple;
	bh=HWbscyG1wAp1OGWy0QrW7y1ttH5ix2T0qkNJInQv1B0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=a7BudOo/npRJWXaZhj0RZafUhPiRZ7uuMXY0wTWt6JF07vhAaoj1IT+2awIxwxKlEzNgTDFEnexTDTD4uyHlZoMO1uAu1NHz9O+Z/CN8tizhWmzP7xkRa/2No9Vgo25bvEe0eZmf+n+oU3c/bLRM/9OXzi/Jc39nXvxEHul5iEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wGpFpQzt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wGpFpQzt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vviURueO8tItMI1FgpmTPEGZJ7+7wpZpZnS3fZFx/+Y=; b=wGpFpQztzaPQNPusx8Up30QY0k
	NNSdwK67HNQGUvxX73DBHuqsTPJqFK/wufjKaD5yF3R8ojxwT1qT6Csnp03YexgEu5rfXe2t8KgsR
	y5douebRREtMtSrIShLgiuiOTo9oE8qJ997Tt9PlWY9gn5xRs1mZ/KBXc/36GCNyqeU1NS1V2J4R+
	+4dqKtr2xtmsEn+QmMUzLXYpRlwHAgaCcO5QP1j4W1rN0us6ugKJod4dtSby2D7EFV6g91bLnWlja
	ot9t5Qt5aPO6Shy+gRMyDqQPIziCKm5MW/7Brm/KZvdbJMPI+WL+z4pivf+Tqr3rT/ib8NH1WQV+L
	oXV/jjSA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJbPj-0000000BUiC-0ceW;
	Sun, 03 May 2026 18:19:35 +0000
Message-ID: <5abcb5ba-6fda-4b47-ad8c-4b6161226fe3@infradead.org>
Date: Sun, 3 May 2026 11:19:33 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding NFC tree to -next
To: David Heidelberg <david@ixit.cz>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <f50c0c1e-ad33-46d9-a9b5-ab56c82a17d6@ixit.cz>
Content-Language: en-US
Cc: Thierry Reding <thierry.reding@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <f50c0c1e-ad33-46d9-a9b5-ab56c82a17d6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[+ Thierry]

On 5/3/26 3:47 AM, David Heidelberg wrote:
> Hi Mark,
> 
> Could you please add
> 
>   https://codeberg.org/linux-nfc/linux.git for-linus
>   https://codeberg.org/linux-nfc/linux.git for-next
> 
> to -next?
>   for-linus will typically include fixes for NFC targeting the current development cycle.
>   for-next include things for the next merge window.
> 
> If there are any issues or questions, please let me know.
> 
> Cheers,
> David
> 

-- 
~Randy

