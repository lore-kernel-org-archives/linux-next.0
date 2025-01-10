Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7462F20CCE3;
	Fri, 10 Jan 2025 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511829; cv=none; b=DLswuR0+cB6gKWzYyu1KEnooS4JOjFYpyrxcSXuIzHEKqBAiDoy8MIfBflHVSWxn3VDNQ+p9C/juIKljRc7WZaJRAarayojmhwzaG3Gy4wQAe0W8R6JnHtUBmyk6OHDel65nUe4tZe4KdAYyggyJNB49jODAD4N5TunrfT1RnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511829; c=relaxed/simple;
	bh=kX7RatWArijfAzaqcDHNzQNl+oGk0J5p4MzhpOvKmQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGu2Gf5GGC5jH861Z9krn3tNDyaw6c3iM5KHnEFJK9VNRWuHdSGLkEsBcdQlPr71dzcwnUMpkNIW+904lTuSZJI9eiZMbKETE83FwqDLZ0XbxVlLfihEI/X96NiuLcRSBlsCjP/EMjvlOROpSd37FlL4s9/D9RyMfzGpYPgJwc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QN8BWTp2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QN8BWTp2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5810DC4CED6;
	Fri, 10 Jan 2025 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736511829;
	bh=kX7RatWArijfAzaqcDHNzQNl+oGk0J5p4MzhpOvKmQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QN8BWTp27VfD9/AvZk9UT4dhgVIFX2IzHrxCCbuJAGnNO6eo+TeLvnOaFn68wdkuM
	 +tlFHDt0zrUNIyb2mc8Je5CfG3pu+38oVIkAAc2HVHog2bPYsgnkYZCCEKO/2ll0Lu
	 ynn7zjrzvF6Rruk0WpndiLl13mqs0lAs3bvCOOKQ=
Date: Fri, 10 Jan 2025 13:23:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, ojeda@kernel.org, sfr@canb.auug.org.au
Subject: Re: [PATCH] miscdevice: rust: use build_error! macro instead of
 function
Message-ID: <2025011022-nemesis-scorn-6772@gregkh>
References: <CAH5fLgjgEeGbd5NUhG1tEKKoj5+cKkuiq25BdeApjtx7SvnkEQ@mail.gmail.com>
 <20250110101459.536726-1-aliceryhl@google.com>
 <CANiq72=N9RMKRBtEuf8qr1oaNVVtfto2S1wXLPRxzfH5N4q=uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=N9RMKRBtEuf8qr1oaNVVtfto2S1wXLPRxzfH5N4q=uQ@mail.gmail.com>

On Fri, Jan 10, 2025 at 11:38:10AM +0100, Miguel Ojeda wrote:
> On Fri, Jan 10, 2025 at 11:15 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > The function called build_error is an implementation detail of the macro
> > of the same name. Thus, update miscdevice to use the macro rather than
> > the function. See [1] for more information on this.
> >
> > This use the macro with the kernel:: prefix as it has not yet been added
> > to the prelude.
> 
> Typo: "These"
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

And I'll add a Reported-by: line when I apply this in a few minutes,
thanks!

greg k-h
