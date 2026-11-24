Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514755;
	b=XO2liTL5BoiBSeXnncCZtsj44KFLpirLu0BAXasNuXliUSeoCxfHjg+CoxCJ9OpWku0m
	 leYi4w34HoT+IelvvhBOC3ePriUUs1jpGhK3oS5X5MLO1zigNqvPaMAsfWOiX0d4yGH5K
	 lRRMCmYaEufRiB+mgizFWqPeFo6fbsBqdD0j593ZCilcLHIkbtICVqs5A3Ky+BomGwgkg
	 s6aHRUQVQFgBri5shpqzsKEAyA0OhdfMOMkNvbMVzC/xzql+4LQdxZy+x+shw11BqVDqM
	 yRJiahqh7cKhwioRjrxlaTp8TuBQBJrlhkQ8YXT3Mxx6kRfdy6fsm9T4ANg4GHpZNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514755;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=T11z0eXVltImi2dicF0V/iMS9/4MgdQi5Pn1QNW6uQo=;
	b=qthf/tz3c2NNTsI9DoaoLjwGaRK3vaybkvtla+YK0s30zouXQlP/Q9rr0igzZgb4rg57
	 b0D8lngNwuhTBWjqDsHCWzfNRCYqAjsYx4ONhvdoDFqAAgT1BfU/sH1G2KHi2yQJLb/uz
	 Yi0/Mgm6bt2Pl5+I+GKZoEPxzj87pCEhhSBYciB9LnxkufrcnMynzlTlInk/rbKpKrtwE
	 eMPAjAeCcHmRkMwxRJSg0I6XzvIoc0FSJMv6n60TMcZvdSjO+LbMNnSETPDkL/wKfx6LP
	 ENBqHC7+ZFk44sJeh7ogJQY2aQNcAtNLI+eLgyy6Vx8wRQpULSVdQMw7j7IsvNbgCuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ituwGa0j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0E4606A326;
	Tue, 24 Nov 2026 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ituwGa0j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA27B1F000D3;
	Tue, 24 Nov 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514754;
	bh=T11z0eXVltImi2dicF0V/iMS9/4MgdQi5Pn1QNW6uQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ituwGa0jdFaTy5AVQdWLm0ttu70StWHnoAQYvrBvdeygXkmQR8N6QuhAWE62Z9MZ6
	 HomG419TeW/WPc9KhO9fFc5CRVqcbvpTGA9AiRtKHv4aRu/thGNA0C1/qUs0dCFlKr
	 GaKdfYR7ESwKiV9qdcorD9wRDOF+UP7I9tyf/AcSs1mnTI1oUXRuh+mLETdYgOiXik
	 lXXcGmQwKhD6ttVEwPYogYt17Uelxqh8uiE+W16RPGvErTlgVArO0oS0d9SR6fgKex
	 Oa0IFgffRhRS4u/TBu5OinHIzK889omFHYA8h3DExELwpTzFxRfZQgza6zdnQO5WcY
	 W0LnVmHg3i38Q==
Date: Tue, 24 Nov 2026 15:35:50 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-phy@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <awVhfmwHfOIy_cW9@parshuram>
References: <awR7nSOWkxRm-iP6@sirena.org.uk>
 <20261123212627.1203724-1-sashal@kernel.org>
 <2026112402-squid-king-c8df@gregkh>
 <3dee4f97-5d49-4aed-bb6a-e3f2567566a9@kernel.org>
 <2026112441-reprint-wifi-4398@gregkh>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026112441-reprint-wifi-4398@gregkh>

On 24-11-26, 09:04, Greg Kroah-Hartman wrote:
> On Tue, Nov 24, 2026 at 08:37:30AM +0100, Krzysztof Kozlowski wrote:
> > On 24/11/2026 08:28, Greg Kroah-Hartman wrote:
> > > On Mon, Nov 23, 2026 at 04:26:27PM -0500, Sasha Levin wrote:
> > >> On Mon, Nov 23, 2026 at 05:45:01PM +0000, Mark Brown wrote:
> > >>> I did not specifically identify the commit that triggered this, it will
> > >>> be some include file reorganisation which causes PHY_TYPE_PCIE from the
> > >>> DT headers to become visible to the driver, clearly there is a
> > >>> namespacing issue going on here.  I have ignored this for today.
> > >>
> > >> I sent a fix for the driver yesterday. It renames the driver's enum
> > >> values so they don't clash with the dt-bindings ones:
> > >>
> > >>   https://lore.kernel.org/all/20261122152857.1113943-1-sashal@kernel.org/
> > > 
> > > I'll go queue that one up now, thanks.
> > 
> > Fix is fine, except that Vinod disagreed (and did not review/ack)
> > original PHY patch, so it really should not go via your tree.
> 
> Ugh, ok, so I should just revert all of these now?  I can easily do that
> too...

Thanks that would be ideal, although the fix by Krzysztof is a good one
fixing a future potential issue. I will pick that as well

-- 
~Vinod
