Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2183DDDC3;
	Wed, 19 Aug 2026 08:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787126993; cv=none; b=ieU/DaA1Dk/LHIbfBgulqGNGO1wuUW+zW+2b4hDLxAi3eukO5oew3jI+UvEzCbgsf6nIzSbJIui5YG0V/uRO7rnCr2/YSRQUvr+sPxNXXRPtt6ExiBslt0g82+vsGziaQAuAngEijmkaj7LLiBPwWqiXuz4jMO4Xv82RA8kZpdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787126993; c=relaxed/simple;
	bh=TfbuuJa8eyKT0WdkeEJHdIg7XWqZlXESRYHu+QrDji0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EUT/I7VgZqB1BoRn6cVqc2FhwU6PIKX14LHLgtDP5YNnMIqsl6tyxBVbVrjpF1z2R7OJU3WWWFy5uF9SP1IY/cSUU29aTrXCBUSkFeAekXs1Q6z9M5yIEog8paRUnp6UQFSIYB60JKcQudtUhFq+owjJL8Ncs5ddsYjysT+lyUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvD+ZvZB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvD+ZvZB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EE21F00A3A;
	Wed, 19 Aug 2026 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787126990;
	bh=DD9LwieM/QY8hBvM+DUoOzPR9yvE3Js5AcxU9UAM/eU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=UvD+ZvZBv3n9dHhXhU6Jdco2Gprhb0oMGEFfZdR13pG6ax2AlcCwhahzqrA12ibTT
	 ikQ4R6uQHfhi0VT+ZYmpub6nw6IFZoaM/ZH7bue8hgpI8HnBXSW7vVcx0py+zhOXHT
	 EJMJfXimhXjfRPQuottXRByxZczoZ30kVE7v9lrIb0NR9UL29jjdMHvtlo4GERWBYs
	 kLEVO06+GUJrvJkaZ51s5nJJo+RV8FI2vumnMAIQ+v6mRxjq7vMBsqgzrneHSeOxxA
	 3cvNZvp6jde2B8qwqEf8sgwqP/KPfsZo65qXr2BRP64O50zK8ljv0O/DYrntIZjtOY
	 gzLMfg91dOevA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 820491980059;
	Wed, 19 Aug 2026 04:09:48 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 19 Aug 2026 04:09:48 -0400
X-ME-Sender: <xms:y2SFajkGT4ChO4-pwUGHi5wlWq0tJ9q4DPxugF954bmpaEn0YcPlnw>
    <xme:y2SFahqwV6eraj1LCm-gLIsOg9h3E2fcsvYWQ8Afkap_fwNj4Ff-F30mQyvpjeRaK
    GpI14yuqCmMg-fF-fKUH_EoIKozNlzzOydB1Lc7CiYLz8ZvyBqW1Q>
X-ME-Proxy-Cause: dmFkZTGf8gJXowjaijCpxjNysaX1nTN+iSgoB9ag1VcPsxNI6y1pGLoWdYSP96aR+0gZx3
    XWdWsJK3CNiTwR9XpjNQBrpjsvcizZObeourIYiLGSpXWv/u+1EcmQSYCRrHI7+8ms99L6
    VnFVHuC/iaTI1YiHKo38iiYVSLES7qtguk3qRQZ+mhoN+qnmw7feLAcRin6mgtTqfJheLn
    3pKvaAZM2ZQ+eUORlu1THM0Sl00+UbV0J/dy7xOB0mR7Hy0fN3Dmfjxe2p14AjLdQQfnLz
    IS+CbP8xcs+aRoZYsa7jPU/s9rAuGzepQrr5OeL0rP1od+zTy8gpcfSVjNUx+4FjVxhoJM
    xWPB10GnSNwh7h9G9vfAR/6wE2pJQVfZGhM+FtGS4cxCdyEI+qwqetumR38+shmB88A5z5
    6hWJ5CYP4+HHASd9UsSZ9EIcskRn5SeyCRmokFseQGgfWA11jKzuqM2m/XQmK744b1iGdk
    NVgcH7dzRRGwzWQKQTh4G7LnYV7p2GRcsP2weY8Bcn/TM11UVC6b37BD+fdxdWBYJgpUBg
    IPWNpVVObFHciYKe+m3sm52DjSnpntrfEEAYRUnsx6FhATUQLARlhcwUJ/J6vSdqe07bbg
    Y3YZNok0CIFkEtqVcwioMrbXwPDXCEiZXoPw2YCog7iVEphbM+gJxgukj1IA
X-ME-Proxy: <xmx:zGSFasPTdeVkfhCM-U0XhBbxqNgcqjKAJBKSDER9jR-SPFeo9mEyrA>
    <xmx:zGSFag6kaTeS78Ec4RPR8Pqier51quSOhUkt6pU93UWhBBBZfp7W6A>
    <xmx:zGSFalmvuNnCg-UdYf3-8kNGy9KXgr1jZTplSnycLvD1NZ_3nKQMLw>
    <xmx:zGSFapT5-73hadGaj-yszsmn195DW13fJbbrKPwmTQRWDkpvbaGITA>
    <xmx:zGSFasGr4ZaSLvhdkDdrH5uALjTi2u4BS4cCNI24912qd2vnI9WkNAEj>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 01E42F80071; Wed, 19 Aug 2026 04:09:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 19 Aug 2026 11:09:25 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Josh Poimboeuf" <jpoimboe@kernel.org>, "Mark Brown" <broonie@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Linux Next Mailing List" <linux-next@vger.kernel.org>
Message-Id: <d24d93f7-3dc1-44e8-a647-e06b530dad1a@app.fastmail.com>
In-Reply-To: <aoTt9Mka8iDVZKIQ@jpoimboe>
References: <aoTGgoeZ_FormkL-@sirena.org.uk> <aoTt9Mka8iDVZKIQ@jpoimboe>
Subject: Re: linux-next: build failure in the final build
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, 19 Aug 2026, at 02:49, Josh Poimboeuf wrote:
> On Tue, Aug 18, 2026 at 09:54:26PM +0100, Mark Brown wrote:
>> Hi all,
>> 
>> After merging the  tree, today's linux-next build
>> (arm64 allyesconfig) failed like this:
>> 
>> ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/efi-stub-entry.stub.o'
>> ...
>> ld: error: unplaced orphan section `.init.note.gnu.property' from `./drivers/firmware/efi/libstub/smbios.stub.o'
>> make[3]: *** [/tmp/next/build/scripts/Makefile.vmlinux:72: vmlinux.unstripped] Error 1
>> 
>> Presumably caused by commit
>> 
>>    c19ac4abbd696 (efi/libstub: Remove obsolete .note.gnu.property workaround)
>> 
>> though I did not verify.  I have ignored this for today.
>
> Ah, that commit had an implicit dependency on the previous patch in the
> series, which wasn't merged:
>
>   
> https://lore.kernel.org/0445b20df50894615ada70abb1e6238f33c78a2e.1786768375.git.jpoimboe@kernel.org
>
> Ard, can you rebase and slip that one underneath?
>

I've dropped it for now.

