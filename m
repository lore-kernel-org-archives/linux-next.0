Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D127230E0E5;
	Tue, 21 Apr 2026 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781703; cv=none; b=CDRHK+3M/KlMZxLoiUdjSb2/5H78p99FXrAO5XMU+VqBVy1oQqGUSAKAa8Sc4JSFIvHFw7B74n2DWDn0/+/PWjTOCRWBcbC8rJrn95DKNAL59mKYmnXhmn3OnIkxJNWXPuOBmU9XAj+2O5xp1bi/iGA8HeLi+WDMqo8LlVNaKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781703; c=relaxed/simple;
	bh=/iGQx4oo84HKAlB7V87gf4dEU8pDBQ/wdLp3gqDJnvE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hG2/9CWjxEDW9Yiaea6+XKAOj8f+ZBIuTuJhpyYOT5orkdbXc9bcbRq+t4coDcVNe9as3jryxHb5yBV1cMgEJW49CaiupeyTXXNlZjoGdyvBPCQYs6A2xpju9+1g5Jyhn9EVNkqS6HUBHf6HBavmO5vE1JiyJTAfpprCho+WMzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=kZwDTKjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="kZwDTKjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83E0C2BCB0;
	Tue, 21 Apr 2026 14:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1776781703;
	bh=/iGQx4oo84HKAlB7V87gf4dEU8pDBQ/wdLp3gqDJnvE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kZwDTKjSO6e9v1LUlvrz3DMlbxvdjiIFP/KUX6R8dXqtpCUBBu9AjPI48nvqOLrEb
	 NJwLh/XqwTBLicNxgNhCrkt+5lDopclj5tADw0CB64qJwrOyUkzTALc7e4sG5hlFDX
	 waQujgIGfte8SMxlJmf5JHCaX8q1peLlb2KbWl+U=
Date: Tue, 21 Apr 2026 07:28:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon
 <will@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
Message-Id: <20260421072819.b1ab891aef59c45226f25247@linux-foundation.org>
In-Reply-To: <26b33b43-da9a-4587-b331-801c19b07676@kernel.org>
References: <aed0zrXLgMtO33NQ@sirena.org.uk>
	<c64e4cf2-ccef-4041-9511-a2dcddbc73c8@kernel.org>
	<955d11fa-a9a1-4956-8d2f-269ccc3f2911@sirena.org.uk>
	<2efaf5cb-abe1-4eaf-b269-bf303b7b8372@sirena.org.uk>
	<a3b85bc7-d9b1-444b-8474-91d0e7f2a41d@kernel.org>
	<20260421071701.641a4cd1f8984c6acb53a790@linux-foundation.org>
	<26b33b43-da9a-4587-b331-801c19b07676@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Apr 2026 16:20:25 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:

> On 4/21/26 16:17, Andrew Morton wrote:
> > On Tue, 21 Apr 2026 15:42:29 +0200 "David Hildenbrand (Arm)" <david@kernel.org> wrote:
> > 
> >> On 4/21/26 15:34, Mark Brown wrote:
> >>>
> >>>
> >>> And similarly for the mm-nonmm-unstable tree.
> >>
> >> I think Andrew uses the hotfixes tree as the base for the -unstable
> >> trees. So anything that ends up in there gets fast-tracked into -next.
> >> Not good :(
> > 
> > Always been this way.  The expectation is that a hotfix is small,
> > time-sensitive and fixes something which is broken in linux-next.  It's
> > exceedingly rare for a hotfix to break the build!
> 
> Yeah, it's also exceedingly rare for my cross-compilations to not catch
> that :(
> 
> Even the build bots did not catch that on my private github branches.

And I'm presently away from my build machine.

> > I'll drop this patch.
> 
> I'll resend v2 later. Maybe we can let that rest in mm-new for 2 days to
> get some build coverage.

OK.

I *could* start giving hotfixes a run in mm-new first, although

- it'll add a few days additional latency (which people sometimes get
  upset about)

- haven't really seen a need for this before

- coverage is mm-new is poor - for example, this error probably
  wouldn't have been found until Mark grabbed the patch via mm-hotfixes.
