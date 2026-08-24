Received: from mx1.manguebit.org (mx1.manguebit.org [143.255.12.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57E40DB23
	for <linux-next@vger.kernel.org>; Mon, 24 Aug 2026 12:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.255.12.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575352; cv=none; b=SkKSbedo63qtiH3yrVDnSvuT+Wj5Lzgjp8xlxfWwlShIsF13FAhVsjCuwovyzQxoJ8gzNKdtmdrW1wJQGT0mtS5IQ4vIFQoxpzBL91zr/fNopH86l9qiWvwOfhfZZilT1iPlldlL9w2BrF6n9gsVbb+OTxsl39pOkk2wcYlSZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575352; c=relaxed/simple;
	bh=Yce6efA0cpN++o8gLy/geZHJykIR1bmeZ66WKvOIKOE=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=pV67srxyqS1Wsy7Ec/sjXuOrUqhR/RJjqbyrx4SXDO9jr7GcLPCHm1KXmDbQG8b4IWudQFYpR+p+h0zAHc8T+UA9bvwokmfQGTN+7HawXd8kHqtcGYY3bZTKlOrZ5fPS4zHx7secq5Qz9ISsDLRDs7fiSHf1Qpdoy8e/FprfG+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org; spf=pass smtp.mailfrom=manguebit.org; dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b=rSUEAaYI; arc=none smtp.client-ip=143.255.12.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.org header.i=@manguebit.org header.b="rSUEAaYI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=manguebit.org; s=dkim; h=Content-Type:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=I4eRqI5+zl+FEMQnwwla9cxgC7O7flJuh1fwq/aaa/8=; b=rSUEAaYIslY25v5ARYpLHoXtF7
	8axk+De4+SC7qIZERCW/NH8MNG2yq0AGtC4gOnd8G8C0a8KF6rYOZD5Tqwi/W1/r13RsqluGMOSzl
	gVbzNNtuxUXJ43AHMuc05pOkFklCbb/xo6sdXwy3eFYKSRra+37ZrGyyijZQcXPfnubKZ3HJloXQ/
	h07gINDhZH9d+uK0un8tHcz3XlA+oxwuD72EeF838GgCPJxn48CwiOk3vXIaxPjCx1LnWyGmmeaUz
	QBtr/w23e+Y/OOybt25pqOkfyk7YDVaFUPJttsQq2YZ56UUzpKTBdpl340B+47GzMvKCe9XNxepei
	bOEnfxog==;
Received: from pc by mx1.manguebit.org with local (Exim 4.99.5)
	id 1wyU0L-00000000Ymo-0kHH;
	Mon, 24 Aug 2026 09:42:21 -0300
Message-ID: <d6f9af6b5fb15945b594c5fec0ad9d7e@manguebit.org>
From: Paulo Alcantara <pc@manguebit.org>
To: Mark Brown <broonie@kernel.org>
Cc: David Howells <dhowells@redhat.com>, linux-next@vger.kernel.org, Namjae
 Jeon <linkinjeon@kernel.org>
Subject: -next for CIFS
Date: Mon, 24 Aug 2026 09:42:20 -0300
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Mark,

The new -next for CIFS patches are in

        https://git.manguebit.org/linux.git cifs-next
