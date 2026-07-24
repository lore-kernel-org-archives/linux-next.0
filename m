Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46273515C3;
	Fri, 24 Jul 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896889; cv=none; b=DYSq/izO9CY9zLezh0V8Iuz0mYJq+aJh6SGB0MQW8wOTQ/8n0CjB31EPSih/s4J0nCx8ml7gd6lqqHjA4YOd+jE/d0asEJIBw35CnUuwVmWro0Ham0ay9imO2X88bbhK/4q1P5+Ikpb6vfMs2olkm0PqLzn21hMUlh87iddPDkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896889; c=relaxed/simple;
	bh=R5Aa5CkC608U2V2bl0Un9EDJGJadW68nM0d3pi3YdzI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pNCQt+cHcf+INeZKYz3oaa560klgOFcbPqYwajYI/e7M/Xp0sfdRknNaH2NHMzabNv0QmztLfwcJZeqi2A9Jum8AvM8BQNXC1CQDOb1tN6xSmTrvQKFuxvBaB1a0NcPRXZPNn/TceJ7PUyD5+WFwDOGGOLqnkXDX5weLh287Nlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0xCaRqK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0xCaRqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE5B1F000E9;
	Fri, 24 Jul 2026 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784896888;
	bh=jGhfvO0/lzM4to1rG4crHayo+987re7cR5n3KyooGSU=;
	h=Date:From:To:Subject;
	b=X0xCaRqKoMtU73Lukw5y6IkXfvW3ZY3ELEOyzrIO46pOWUzUGK9pUWU0WFf/q6qrf
	 oVRn0O7xXGmV/kkjMqpo7mhAfRpW2pu7JR2sJ4FFlhvLFlwkzYe585f+V4ZsvlKzv6
	 iVmI/wgwm3SSoGJTa2CKtu9d8Z9WpR9wyJiJ0hr/jamAEeQMvtFgLdG0ShSGhD2V9I
	 s/B8P5uwmmyAcxt1opt5Q72L04nIUTpvkJpY/QSRiazL2PN9Q65jWbHHUtUZxuzZtf
	 SDxIzlQZ2n2ztzaOwHTysJSldtjyO1uGCwxoha7Xp6tmBMur4c/2HRo55Ql8QXRb9E
	 CZ3XbHTDPpGCg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F0BF21AC5AC8; Fri, 24 Jul 2026 13:40:44 +0100 (BST)
Date: Fri, 24 Jul 2026 13:40:44 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: No tree for 24th July
Message-ID: <amNdTLyopiNzTE77@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Cookie: Take an astronaut to launch.

Hi,

Due to a mess up on my part there will be no -next release today, I will
do one on the 26th instead.  Apologies for the disruption.

Thanks,
Mark
