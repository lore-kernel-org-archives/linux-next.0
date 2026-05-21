Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4217384CC5
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 15:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377638; cv=pass; b=rwgUBDfl1onAD9vvi8pnymnWsY/MpyYwu7lnrvOlrC3fAfaMcoHFRtDDbPsPgA2PkcDHo0NuckNsl5KdDXOQ/3TgZGiZ2y+SLx1pK8alv+zDoB0jb9vHMXN2WMrdWUowqyltHC9B2vda5G4mbWntcCykbLZWWCuLNmU7p1O7XCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377638; c=relaxed/simple;
	bh=sn6L80fff7RmvF9LQeKMQL2KqOMhwqQk0jUsKcmdKNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDFs9S0M2rQiAmRGWxx6IMy6agXjb8mEo9y5wi9zJCuz/bZAt34jnFc3EZLioVV/Zg6dFLLOzVM/s7u2jyISsYJlwR5nV66BINh3WBVILDjIFiapg6gzHeHI4YJUjBJPxB9QJ9cHFPdL9HJ1HDoO+WFslKMGs04QM17qcYb8drw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qEPOQKTh; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qEPOQKTh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so1625ad.0
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 08:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377636; cv=none;
        d=google.com; s=arc-20240605;
        b=bxvo+/ELYCz6IfxLBpDcC9Re9geDSWyhUhK/6dT5nI89JmjPgpqesEVamarNY2Di0K
         PkoqH5UXNFi4rBiuvgo6IM8rHhvl9td8NRHGlOxJRBsOfk5oWMcKOq/MC6NU9tOr1MTM
         sPL6DeW++M0Tvc45NwoEfIpjGWRbYqvSlHllFvjYP5HmL+tgokORSL5gsWn8KWe0UvoQ
         HXczfsylgz/kSuILQf9RJ3aWkao8NmuMb0ryUtGveD1YdfKe5WS8Q/SeKSwCk2oavUIF
         Qz+1Yb10OnjX2w7xxVyW8VlqoL5k0BSSp8J9F9filuprEgV+5z4hp4rab5ayPWE22mRK
         SbvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46Zj+FxgnBw3fvXlQ2IKhtQfapZr5mqR8oNv+yVA6mM=;
        fh=3o7lLdA/yPIrehY93C1bZWjLjjo/juNhXag07vXSi3Y=;
        b=c6dtHMNgrmzdq0+xwQMxlqDnJpX9nzAKTtmjhKh803WIh4wvTBFhQAvqsRkG6uoqP5
         w6m0RWMRFguYuyRQ6XsLcPoV65Rjhhu7ubO3npbGxTWugDKFUzQgF7mgG3No3Txx+pox
         YH5lxnSQeSdFuEL4Z5Jf4z7yDrVJx9wZVJWdhQvrirRVaOEAY+uYVPXSmXfuODsEP1tz
         5Hu7V6LB5if7vAk0jspm2V6Q8gO8xzodTt4I6RGlkuJtu0frGLA8FPLUL9HZHjJ+dDfZ
         05uipf/S1OtQgbVYdbUXVqoPK7t0pVVA6qOjGbGtUFYyC6z80KQASf3bNOyZ9jaJEHMq
         WoAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779377636; x=1779982436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Zj+FxgnBw3fvXlQ2IKhtQfapZr5mqR8oNv+yVA6mM=;
        b=qEPOQKThqYWuedX46tc3fOwUsu01PtHGGPnFvQhCpYrFjZWqGTGBuxLIcshlttovup
         Iebr2Xb8q+nexlXDfGXOz+rcIoWqY1z3gWc/GuxVsm/XfdI5420vQPb7MBkiWNm0XSHX
         GG76qU5Ij3HFWQeeUYW7FnhMpuRPk5hSvuj5Jgg3awwfIzNfO0ZX+1D8ZeXy/pfWhNRU
         4Kimu45xpomtORZ3czQnKEdelx8oCorClOG/oAr8mgyh0Yt+FP6Zj4aEkzYljKNcGaqt
         SnGgyStMe5BVltuCQqmFFn6Lq1Pm++csdkIq9z/k+0Zxr4xbbBq4tXG9Wvx1d1Xpi1O8
         5+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377636; x=1779982436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46Zj+FxgnBw3fvXlQ2IKhtQfapZr5mqR8oNv+yVA6mM=;
        b=ew8Vhk03O0T4gjA9dyiQaFKH1nBnFBj2/XH+iHxywPFoirNbQO4B1ozaKxU5aJvmA6
         0JfXb0JNR/allk4QT2AlKJcHbs2VlljfHEMYtjC9pUTdXhgBlxWeOGsKlEobBWfppm/P
         XSYyPqEd02Fp9YmGEWIA6KIRS5ZEk5EUzfNxpOscAB6HripaEh7I7oS/Wx/dNIVs+VvH
         E6WesL2d4G//CjDzmjcIF4/nkyij+naUVxyhKr9bDKbOpNtXEvKvyZk32Mm5PopcOCHx
         KR8KuVmffRS/+//Yc83FaZJGkG5wP6qH47qsPI+4u13jWTrJuz54bL+zVes/FHfYIkWX
         L6Wg==
X-Forwarded-Encrypted: i=1; AFNElJ+oIDmyZw4PHJ2/M3dc6jgx5VB1EnkDQuJgj5Mn/QnXfFWtVuYq6zhEGL0j0HLLRMfKAGwHw5pinplG@vger.kernel.org
X-Gm-Message-State: AOJu0YzjBbvtf69qHu+3//0scPRv4LQlx+UCgH88OxAdsMrRQ0cFy1e9
	20UlK/s1/8eBXtNZhvGohbEeoE6sTeo54kxQvy1e+AskUOZVFLWRzuIFxVGRjELvQsKkpoxkaat
	q17hrxzY7CdLxNonH+LJNnQUCXy8a9K7vtSAHncub
X-Gm-Gg: Acq92OGwdnTICQ93rWYnW1pItZcbK7QXj/a5W/5CktktSyErw60QCPBeeVMfB59i24y
	JrVBumyjAPfEb37a4Jg5Atim2Lvnpozaedv1AJrrXRdJXcMWEb4t4TSgoeQgSdYjbHCimBNWQR7
	wZzmnE0LKTVgKKiec7s03ncFyUZtAdxMtGKl9K+lH2X/yUdIqkd42IIMvK7ePdHOjRBYFY8LDFj
	7DBszlvv2JWFRUbtaMKNgWAj3QstXyp6Ahdcz/uQmfH0mPHayfTUSOeRxpGaz7xdCKa9vxLmnGg
	K0QKm08vAWDbm+tR/Rivje+PrWuyTibm5R3qq881/XHYd+Ny
X-Received: by 2002:a17:903:3d06:b0:2b4:641a:6b7c with SMTP id
 d9443c01a7336-2bea20bb1ffmr2314365ad.13.1779377635867; Thu, 21 May 2026
 08:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ag7cF9XqINQyrq6f@sirena.org.uk> <31bfcd67-40b7-4dc2-aa88-a4839347f005@leemhuis.info>
 <CAP-5=fVH=fETWYO=VKuA+aC6=qjyqEmku6JeJhB=q=Nns+rMEQ@mail.gmail.com> <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
In-Reply-To: <e08366fa-5fda-4534-8545-5d446734387f@sirena.org.uk>
From: Ian Rogers <irogers@google.com>
Date: Thu, 21 May 2026 08:33:44 -0700
X-Gm-Features: AVHnY4JDiUSEqKeacnUhtX-VqPVOvH1b7rRTg8ji81QWy3VD6JnI7xQDNTYvteQ
Message-ID: <CAP-5=fVPhqFJZijEUMCB0AAF+CevwBukyfmt7nZQw7MObyi4CA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the perf tree with the origin tree
To: Mark Brown <broonie@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:31=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Thu, May 21, 2026 at 08:04:11AM -0700, Ian Rogers wrote:
> > On Thu, May 21, 2026 at 7:55=E2=80=AFAM Thorsten Leemhuis <linux@leemhu=
is.info> wrote:
> > > On 5/21/26 12:19, Mark Brown wrote:
>
> > > > between commit:
>
> > > >   552636b9317c8 ("perf trace: Add beautifier script for fsmount fla=
gs")
>
> > > > from the origin tree and commits:
>
> > > >   32969ef6e3e19 ("perf build: Pre-generate BPF skeleton tooling dur=
ing umbrella prepare phase")
>
> > I believe this commit has issues with "perf trace: Add beautifier
> > script for fsmount flags":
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools.git=
/commit/?h=3Dperf-tools&id=3D552636b9317c8a843dd4496d77e56976ab48c76b
> > This change went to the perf-tools tree and then to linux/master,
> > while "perf build: Pre-generate BPF skeleton tooling during umbrella
> > prepare phase" has gone to perf-tools-next and then to linux-next.
> > I'll look into a fix.
>
> Yes, that's exactly the conflict I identified above - the lack of
> coordination there was pretty surprising TBH, and also the fact that
> 552636b9317c8 ("perf trace: Add beautifier script for fsmount flags")
> went in after -rc1.

You're right, I'm only just waking up :-) I'm about to send the fix.

Thanks,
Ian
