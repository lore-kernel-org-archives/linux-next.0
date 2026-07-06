Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062C63A9615;
	Mon,  6 Jul 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783349441; cv=none; b=O1mDkRbkSA39H1zWuJJh1rEPN+uw6avLA9D4cFw8KwH1lV7zKqFOyMM6Ti0IXQWI1bXLYb9h4xS4q8c/6BOBH3yIxPyt2MHAqzVut8QOAE0x+SWWygOj7Np6rASCewP2Rr2uezR2XXq7xOCmqP2JeUltS/9iie2qa7KCQcdu6/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783349441; c=relaxed/simple;
	bh=AUhJl+za8wUI+IxonHXJGKoBaKdF63SFXBJEYGoId6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5H354keJh8vji4fwVGB0P1xBQ+Y99ldbqkZWHgoII0bdcK/Cr+slJ+RRKSTTZNz0Rr0DiPYuHJkRNlVoRtN+R4mk2z8L2NoM7mQVu08q8THe+jUng9u5dmEbzLPs8XLmQe47vqfbe33c1/PLOG+fByKzTE/9DDPm8sMbbok4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KjxTGRDD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KjxTGRDD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38AF1F000E9;
	Mon,  6 Jul 2026 14:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783349439;
	bh=o7wbMZRxHVH1ugZBmoxgXfaJAPq3g8oO+YIc/4WmQ48=;
	h=Date:From:To:Cc:Subject;
	b=KjxTGRDDCOh55YKXPdPvzcSIz/Fz+PCV2WzStDVM9Yk2eZmhzAvKUdyf0P8n78DF5
	 wPKBVitKBKJqiZJss0kWJU3bprWno+t3lg+zuUNjH8PfX/DhqcGvOQy+oqkh5T5xxv
	 HOb1zF9t/rhBBpCXFZECUwx4w2gRrMaM7YOBCqILinRDyHxjr33gYt6t26O/UfUk9W
	 chUNA/1mSb0xtmUBnAEvamB2B8BayHLrhGuVebS0uRT1J02mXXUeRrUP/tUUGw5pE5
	 DFKLHhsYZ6elyvU4yDReKyhaM+MgayR1otGvBuyPGSMnC/PM08uEo85nqiccs1gkKE
	 Qw1Mol+71jjxw==
Date: Mon, 6 Jul 2026 15:50:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in the final build
Message-ID: <akvAuzqXtDrttQk7@sirena.org.uk>
Mail-Followup-To: Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In the final build, today's linux-next build (arm64 allyesconfig) failed
like this:

ld: drivers/net/wireless/nxp/nxpwifi/main.o: in function `is_command_pending':
main.c:(.text+0xa348): multiple definition of `is_command_pending'; drivers/net/wireless/marvell/mwifiex/main.o:main.c:(.text+0xc188): first defined here
ld: drivers/net/wireless/nxp/nxpwifi/main.o:(.data+0xa80): multiple definition of `driver_version'; drivers/net/wireless/marvell/mwifiex/main.o:(.rodata+0x2c00): first defined here
ld: drivers/net/wireless/nxp/nxpwifi/cfp.o:(.data+0x740): multiple definition of `region_code_index'; drivers/net/wireless/marvell/mwifiex/cfp.o:(.data+0x840): first defined here
ld: drivers/net/wireless/nxp/nxpwifi/wmm.o:(.rodata+0xda0): multiple definition of `tos_to_tid_inv'; drivers/net/wireless/marvell/mwifiex/wmm.o:(.rodata+0xe60): first defined here

due to

   4c477f8bfc1a8 (wifi: nxp: add nxpwifi driver for IW61x)

I have ignored that for today.
