Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC6233123D
	for <linux-next@vger.kernel.org>; Thu, 21 May 2026 15:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378254; cv=pass; b=c3Up510eZOk87O2iLka5hJqKKmGny1Jup8sjCvQsIZR+JjIIykGydh23kNNezxcx7l0w2MEMOd02HeCIECdItHZNqeGccJ0hcDzNt6UZ03//kXRNFDVVwUDYYL8pEtSWSmBCN4OBwN7XJ0OC/DIfDq9t0f8cglv402bPhbJ9TGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378254; c=relaxed/simple;
	bh=awYjO8zdIp3wynG70736/rBX5k7T06Cejr1FXNw5RlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCGIa0FI4LoTChBw4h3m3QKoBi8yA3hncAyMtchJDOQCPjma4/6gBqESznnfLydG490ls7tvBXNlpmnsIVKXjbLqZ2XrYlbyTRZykfNE1jYGMBHpCtF8m7xiJJpcE6z4rUBLdnmGq1Zw6ycPrHHSixixXrmJuKqpOcFMReMY5To=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vscV8VgU; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vscV8VgU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so265ad.0
        for <linux-next@vger.kernel.org>; Thu, 21 May 2026 08:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779378253; cv=none;
        d=google.com; s=arc-20240605;
        b=PUrOFvQYDsfWd+UEWGxPHHIO/HIWtagXH+gX+UnYXNM6M3Q2mAnERZhVi17JPIFYpM
         dRp3Zy2CXEo3GViWimp57q1/T20o2Uc1U8QgRzZMYz7CfGcoUrewaqTh85VAB0IdYYEM
         IKVsrFuBxdjUnXlhL/dTewFlxzvj2ZvHCluN37jzwd6A0QaNh+k/+BcQRFqppYJ3EDij
         3wVRuhH/qThi4gtI8QJKHrspUM/Z6ZeRHYJbPNConpIRCAjJEdigxrjsqQOgaEfxPwkH
         lRcgN2gPUVPxCYEc/Mi6Ha+C4eYapzWvTFK5KnHP6PQvfg/AkiaQdnehpXC14NODRrOZ
         PyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p/m33Ss0Fd3F2O0hBIVqDWzWfJ2R7y7AXUTg8JWoB4M=;
        fh=aX6d5x6n+RdOa319M3LT+6ukbGtetmEcdnb6n3jgBn0=;
        b=dTzufzh6TXKjEapHwU01ZScqEAMtCCSRpXxO89vg2qgzkKX0PsESIL4jKQ2AmqvvdJ
         3qq+SXkOGTe4HxlAC0m0TR5P6Mfj/DpsZuYpJJmOw4PeN3CaJf0LeuXA0c3jE5H0EjmH
         xvoBfOPrRbK/CvuXeEnihyhLhZlshLf7a7zbiGJaBA1lvOGN1sgUgGJ357jB4fQ+qiop
         qlZ7A3gH6JV7u67Z51mWrwfN1DgZf73+PPNYw2HyXVDAqL9bnotKjlIDWoAzQtF57ZVM
         UZi6QqBmqmynAT7OJcJzXO885wOu/EP/bZdm5hMQUcBkXPBT2AuXr8eJr56Xd7krZlXE
         1lRw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779378253; x=1779983053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/m33Ss0Fd3F2O0hBIVqDWzWfJ2R7y7AXUTg8JWoB4M=;
        b=vscV8VgUp8008A9/RbtniOwJwwVtny91RFWjmyzAKydaOSW7cj7g4Usx3R3fNsglfI
         7b/oDp/iHWPsErNG2bdxzdtYZjZSxXruuMMKe891BgF3OZHtNEK7kSfIFltCG4I2D2BH
         x2AEaJI7N1ZT57USxHf3/QoeesU+k65D8rXTlsLmaWIWULulINdkWemeHNH6scDctQpt
         2HnABHnRck0XfKIIwMqvdZkuCqIX5GZcn94veRfTiZ2KvBcMEiBbMYxqA+zkJlMr/VXy
         +EJGs4XGXslPok92tIHRdZGrlMrVe2aHlBnZx+YoQ8DZWZ1RGytmfowDKf6YS0D/+2AD
         qc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779378253; x=1779983053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/m33Ss0Fd3F2O0hBIVqDWzWfJ2R7y7AXUTg8JWoB4M=;
        b=gVfgLkCNsEY90Tj7+ZLeaUnLt+tEu8TSuXwlSeS8LgItFZlG/aEFcSrlIcBEGF6Ght
         yNZkJXXTQrgKJncZDVoPdBqCbUyLtItMETDCxAyMG5VvPHZRN+0a1LCfK/yE5+VZifLc
         O5BcAyvOg4yV9DdRkTP3KX7EPpPkLSbFzxRItetyGuUMSyBLFFGUExF8tdDdMar29mW6
         sG7CytRNLSwMKrnbFo/TTRFAfdls1NicXMCMqvoC1f/7BU0B9q+EWIi5DOqkOGmOo1kg
         axnjP8Oo5so5Djs4KiCj/Pr0RZ1as2wkHB8bV+vjCdQcmhLVNJ35PXIhbvgb48TjpRge
         uetA==
X-Forwarded-Encrypted: i=1; AFNElJ9I6Dl0Qrxy/iT2m8ju5x2do3PGVsU/rQ7urSNNCI3+HefVqdquMejBVwev3BHNqzXCKi1uRqdvblYI@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEd7Yr/43JOrKa9Y5gvUyznKrXMJwAm6EztMe9pipYOWLXqkn
	9HvCwd/ZEOhCJe9t8klOBbMNLcutTnvJiXvRTSfrAcwoBKCQQOloXdc8ov0vJ7ENp68ObYiMXFK
	MiJ636NzmP7dT1048HZVfJ4WhSPY3ebZ1WV1eE9I6
X-Gm-Gg: Acq92OEiguemasre/SHaTrqVQo/MK3UXrzTEEzARvFwz/nyFCcgcJViKJQiMffUnR5j
	2iMZGtRoz1AvHYxqS5jrC1tkSQ2V5nGbKKZxmjtg/zNhuZ+lvytiaxDi6sKKGckoV0TmlRGDWWe
	GFs67A3MEwJjdxZczdJWNzvdrEKFZ6f1VHK/js/7vxggSd6YjW9rpARs2xNAQn5DSq05lrV81He
	TRmNQUU9FCt7ZUxs6I9DWCBrs1x3TT38cv8jFxsOCeSKP0WgaHHnmhulzZ1PNjdwpUxcV3uYLJt
	ZfdrLyahpgdCADmiKfmIKbib/lDRn8XdzpeWVIEAfP6iHWpf
X-Received: by 2002:a17:903:350c:b0:2b0:b925:da98 with SMTP id
 d9443c01a7336-2bea21d213emr2628015ad.19.1779378252139; Thu, 21 May 2026
 08:44:12 -0700 (PDT)
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
Date: Thu, 21 May 2026 08:44:00 -0700
X-Gm-Features: AVHnY4KYKNRUtRdt7C_Nw8O7bNeUVoxrAbyV_T8vNbGuWw90BZjVHH9GK_DippM
Message-ID: <CAP-5=fWrX932GpmHTrZBDrOUJsP7CwPzbKGhGx0PO9_awTASxA@mail.gmail.com>
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

So I sent the fix:
https://lore.kernel.org/lkml/20260521153558.1421014-1-irogers@google.com/
I'm pretty oblivious to the ins and outs of merging, but hopefully,
you can work with the fix and the commit message.

How this happened: after the initial perf-tools PR for v7.1 Arnaldo
and Namhyung prepared a fixes PR, a large part of which involved
syncing kernel headers between the regular kernel include and
tools/include. That sync exposed a bug in the "beautifier" scripts
(caught by Sashiko) that scrape data from header files for "perf
trace" an strace like command that displays values for syscall
parameters, not just numbers. Namhyung wrote a fix along with the
header file merge and put it into the perf-tools branch for the PR.

Anyway, I think the issue was that perf-tools-next wasn't up-to-date
with linux/master and therefore didn't include Namhyung's change. I
think we can do better in the future but there were good intentions
all around. Sorry for the breakage.

Thanks,
Ian
