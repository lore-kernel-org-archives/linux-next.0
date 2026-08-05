Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD83C41F5DB;
	Wed,  5 Aug 2026 20:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961364; cv=none; b=nI+UhbTy5HNHvLqTtCApY1/sTtx7vCmaeiXMksLRPBj9I4E2a1frdv+mzNFBY72SlXhIy4JD6IR82Y1wPC5H4I0uhBh8U5FkBLxd23+pRsap217FFiRwBfKQHV+bz9zP86MSWPlT0TkQeW6KSvD+RT8hGs56fTb+2Tz7vxTDtzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961364; c=relaxed/simple;
	bh=L9FB7vuEwm+9K9gRmLL9HqA4qeQYKhsdSzQZmYCFE9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mL+I4hLbhs4jeLPgUyeO/m1jLZjJJZmdxA+RNzQRJqOqwA19zJIxOsWsNqsOCzNlWtF6nzWEQ3yYZQt8J0dQ/8FSVSX/4pyXj0MJoHFgtymPQNia+M+Nq+v+uVI9ZNkIEuQfjpcI/EL0fMDMWM8udXPF34EoZYgNHbZIUjQvqJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf09.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 1AE17160587;
	Wed,  5 Aug 2026 20:22:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf09.hostedemail.com (Postfix) with ESMTPA id 2935C20028;
	Wed,  5 Aug 2026 20:22:36 +0000 (UTC)
Date: Wed, 5 Aug 2026 16:23:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: Mark Brown <broonie@kernel.org>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, "mykyta.yatsenko5@gmail.com"
 <mykyta.yatsenko5@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in final build
Message-ID: <20260805162327.4dee0a76@gandalf.local.home>
In-Reply-To: <CAFsYEOKG7=Os-jLadKF2pcfb9Thh20e9HhOvU288fhkBHziLGw@mail.gmail.com>
References: <ff58b01c-3f5e-4d55-be82-609d2faaf12e@sirena.org.uk>
	<ff3c03f5-fac1-49e2-be18-66f5ff773596@sirena.org.uk>
	<CAFsYEO+soZiSo6RoYhmby_ydEAfSri48FKivj8ndbJV-8JDEAw@mail.gmail.com>
	<CAFsYEOKG7=Os-jLadKF2pcfb9Thh20e9HhOvU288fhkBHziLGw@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: dimdaapyrw6wa7zprwh1zgz99k1e87dn
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 2935C20028
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+QZIv67TJsiGhKGAMEHGR6SveLjU9nOc4=
X-HE-Tag: 1785961356-738585
X-HE-Meta: U2FsdGVkX187/jzV4CNkEWxA8HFY6kS4a5ysP7v8kAFij6Tp0H54lNDDdp3sOjefrxMcplbYQ1rpot6AXtMQKryI3wHAP1KrO4e4ATEXVPQ1Wt/mbSbMWmc8VMz7dT7QiW5R0hRpYfqIODXWcwBVzREyzm3Jj+2WRH+Eg0kWYfHQO9tH5GBmp4hEK8UAXaaaDej7p7Xl36Jh2eA4MIo1d2j52+3UVMV7XAKFJJWMTQrsSGpak3jX7tY/BMvP5yd8y8njLIfxqU62eHacSkNJObRRzUVqrUM8bfJDGK0gfyhtJ9Bd8hLdzp5KRzLI5nFsm6KE+jw93rg0qHaYwEzuhl2I2+Iteq1dhtdGAPqetrpEOHx42jAchprPQKIHc/oHREx1AHsaLhrNdy4jfzkh9Q==

On Tue, 4 Aug 2026 12:48:37 +0100
Mykyta Yatsenko <yatsenko@meta.com> wrote:


> It looks like Steven is on vacation, I'm adding Masami and Mathieu to
> the thread.

I'm back. I'll start testing it today.

-- Steve
