Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B9326939;
	Tue, 10 Mar 2026 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123978; cv=none; b=LVDICG3JTsc3+ZZMVhYDOcw+BFgqPAplkYFjv8ORjnXZ2nISOncP6JvPM+gFTDaMQxThaH4MlxPQPQA73cw6ZejGbmQ1g1sdwAQtkVttwIqE/UPvpCA9sXtrMn4JEU9FMeAVXtLbqU5v3tap8Uq5b0mIQnyUITVm0yMemM67B9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123978; c=relaxed/simple;
	bh=ljn1E+tXd0zBZGDBpUhaZPcqtxFEbdU7ebsEzOK/RB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhzydXS8nmRM9Fe5pztlP38TLLUetF+xwIIaAX/737cvT/JwVe76D97QRIMjtyStzNOYkW84XjrGjCLwexcXOAoCnUBfu48YPsNX3VXp0GZRJ9tkSC96vAQxgZOR1Ehr3HEov0Pe1aAqcNIa/MUo+c0RZ8o7mmLI4eu6JySJPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 1EB8B68C4E; Tue, 10 Mar 2026 07:26:11 +0100 (CET)
Date: Tue, 10 Mar 2026 07:26:10 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Keith Busch <kbusch@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the
 vfs-brauner tree
Message-ID: <20260310062610.GA9797@lst.de>
References: <aamIvIWiZDDCmNYG@sirena.org.uk> <20260305145428.GA17884@lst.de> <aam-ijUWoOP5hhAr@kbusch-mbp> <20260306142257.GA16612@lst.de> <fd00969d-15fd-4ace-942f-a2664e317813@kernel.dk> <1f9467c8-6982-498e-ba4b-7a16ccdb4dc2@kernel.dk> <8d82d803-4278-45fe-b64f-36c26807fd0b@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d82d803-4278-45fe-b64f-36c26807fd0b@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)


Hі,

it looks like the for-7.1/block-integrity and the vfs-7.1.integrity
based on it are branched off 7.0-rc1 and thus miss the iomap fixes
in 7.0-rc3 and thus create a conflict in linux-next.  Can we fix
this, especially as the main for-7.1/block branch is based on 7.0-rc3
anyway?
