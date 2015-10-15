From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the dwmw2-iommu tree
Date: Thu, 15 Oct 2015 18:28:53 +1100
Message-ID: <20151015182853.2d770f13@canb.auug.org.au>
References: <20151012183257.258edc4c@canb.auug.org.au>
 <20151015135500.5fe9af8f@canb.auug.org.au>
 <1444892095.125804.210.camel@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36574 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754012AbbJOH2z convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 03:28:55 -0400
In-Reply-To: <1444892095.125804.210.camel@infradead.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi David,

On Thu, 15 Oct 2015 07:54:55 +0100 David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> The problem which required said patch should also be gone, though =E2=
=80=94
> CONFIG_INTEL_IOMMU_SVM now selects CONFIG_MMU_NOTIFIER, and its data
> structures are guarded with #ifdef CONFIG_INTEL_IOMMU_SVM.
>=20
> Apologies for the lack of an explicit response (other than the implic=
it
> one of fixing the problem). It should have occurred to me that you'd =
be
> trying to carry the patch forward.

Thanks, I will drop the patch now.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
