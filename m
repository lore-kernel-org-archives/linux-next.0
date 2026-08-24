Received: from mx1.manguebit.org (mx1.manguebit.org [143.255.12.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7AA41DE1B
	for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.255.12.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787577991; cv=none; b=Rbh/9hhIBsDaVKV+71I4dP7oA0fTfFeLX70vPlck8Bo3M5pUcBvoCxmO7YhAIGtHgqmwvoo3Q9Jcz83TpuKIVuBBuOSsRVHXFXmhHHGNQxlNS7ntvHgWJpO+m1+Vm/QWrIfyd8E1XOSSCjTn+AEFEaS5MGC4FpkyhRuYq715yGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787577991; c=relaxed/simple;
	bh=U2hrydN4YRwg5EFXqFdcVvzcAI9UOoA+D5AJxX30fmQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=H77tgn5RjTtj/QyOEcfZLVun0cdRVmEe3VNsA4VuJ4AKxAaK+JY/VPc5V+GBVpXmPy81lK2mqkdmXidUB7MYFgiVk6VA1T5JRDmPWm9UjzaXYh5M/IVjEU2vCWVkz69g9gxs1EkZhoPj+8B+bDfJpV+b+q6nQRn+eIi3IKONpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org; spf=pass smtp.mailfrom=manguebit.org; dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b=cqc6uFFb; arc=none smtp.client-ip=143.255.12.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b="cqc6uFFb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:References:
	In-Reply-To:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6VVY/0AurABC9rkehz7NS3fVzW5lk7veV8CeajuTN9k=; b=cqc6uFFbwkyHacyGL7uKicKwYO
	IKGDe+E+H70hXFVYoh2sssFI+pyPxT5xJVad+Q1ZxR1HRHJ94McaFkUD5HSiHH3PMmOwzVmoaf6Ol
	gk7ydEqTARICqG+ngW2dtHb4FLzKy3AEI3JJZr/kbrObIvr6t9BZPFdr8WPdKbr61JqG4l/5/cfu6
	PfN7xass3hNCSW8tc6iFyjk2LOXUOpIJOTlILTIocYOCFP0y05ETQ4Z8o2faBJC0QGxP0LewS8wV8
	6Kq+Oh2cdRh8VimIh87sIVOhXWHO75V1a+1MB6ZTx+oo8xpBHoo9sGvWt1dX07tlOfJ+UwtTNZ3AE
	VxuwOSAQ==;
Received: from pc by mx1.manguebit.org with local (Exim 4.99.5)
	id 1wyUh2-00000000YwB-1qi9;
	Mon, 24 Aug 2026 10:26:28 -0300
Message-ID: <250be9700243abbc7e08406856b93357@manguebit.org>
From: Paulo Alcantara <pc@manguebit.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, Namjae
 Jeon <linkinjeon@kernel.org>
Subject: Re: -next for CIFS
In-Reply-To: <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
References: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
 <e2f818f5-c2cd-4975-9be8-f73101a36081@sirena.org.uk>
Date: Mon, 24 Aug 2026 10:26:28 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mark Brown <broonie@kernel.org> writes:

> On Mon, Aug 24, 2026 at 09:42:20AM -0300, Paulo Alcantara wrote:
>
>> The new -next for CIFS patches are in
>
>>         https://git.manguebit.org/linux.git cifs-next
>
> Thanks, I've updated and will use this tree from tomorrow.

Thanks Mark!
