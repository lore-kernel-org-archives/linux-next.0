Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D5D390613
	for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665793; cv=pass; b=Dvg7wZALWDHN7Yp//1wvrZPchFbjYWu9AIePHebovIOMXWklv7k+mrwIa7qMhg7h8xcLIESK6b+wJYD51JS52wZyKVrk4o8/dYwaIcQCFrSOXng4Jn6jijoFTSIc4aSQiv0Vx7eo2peKSb0GmMgrfs9DQD/Nu4yKysUAOgw2KMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665793; c=relaxed/simple;
	bh=0GgdhtTQEZBAgnXDRC/31uVjxxCVNWwacF/J96WvlwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQvkDrFtbxMKBgmJNZ1HbU1uUaKz7WHPB0z22np436VAq8oncsJcQO5VSZm/9ZeDHVevE87W6O1X/h9sO23m9LeR6jSaCpkp2H4xnmQ9ebaLZzO0EZeM0hj9yBZrmM3EJJ9PF4pstyHbFDSkUJ8Yg2cD9Uduj1Q75ebsui/j1HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iB+vYCbq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OSNRG8Zk; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iB+vYCbq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OSNRG8Zk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787665791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vHkrlsCndgE2YxDUNwvQj5eIRLdielzDJx5kJiaaFSU=;
	b=iB+vYCbqYf10CtDwU+e5H7q4V9kLLZN+O4xutZatxoYbbbzKYkmgLy1k1xfsIBtvysqMya
	JZMVO9qD+8DXiyYDLBQr+S5yjALo0+chi5ifBaDQXVgvXTUUOf1Tyi9MpFY4whaWE3qLzW
	vx0Etewnlk9uPnK44zOgLAyW/CaDOGw=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-AhXDuHi9NaeGCEXMxTJw7Q-1; Tue, 25 Aug 2026 09:49:49 -0400
X-MC-Unique: AhXDuHi9NaeGCEXMxTJw7Q-1
X-Mimecast-MFC-AGG-ID: AhXDuHi9NaeGCEXMxTJw7Q_1787665788
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so5769881a12.1
        for <linux-next@vger.kernel.org>; Tue, 25 Aug 2026 06:49:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787665788; cv=none;
        d=google.com; s=arc-20260327;
        b=gUh4PAfBrkcT/3d+HtbMCX0DqO9zXkVmorpXgeD3tdz78tiLShonCm8a72LkVYbJTk
         TrlWishKYYPlnKv6GNbBSWsoSI17kHZffYtqdQ4ZwWru+a6u/wRWIwhZdeWRsB9NuCkW
         h7Z6TPzLfcS0nW6jIDFURdPiDGo8C71t1ImucHf5znhYCuilRZSxJnLtDdbs5/zgRQN/
         E1mmNomDf91wF4yntF4SSMalPMvX67eO/olG79+/qT7LCPrTYIFtLEacPIj1tqvhDo8T
         Ho2qsi68dxr8Y2Qa08M5f6Iykfk9drbs43qPv+asYMVp942Z9zb/vS5PRMHysaXesvrA
         feoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vHkrlsCndgE2YxDUNwvQj5eIRLdielzDJx5kJiaaFSU=;
        fh=Sc6QMSiC7MFJttZMs2rPpG4jvHnuJZ+U7zW6rN+M9eo=;
        b=VHdTCAv8wyWblCddJpp7lbSMXyYYt4SXTmKqY++RLODuFPHEvEcBt38UWvqH3wSjbM
         Bu1Yq2OZzuD4mKH9S0oAPBGsFhf9MAJDSXhDPyNXoC3Ocw83yIRGU+tNYqA7tIeTSfLK
         VEPkif/pu/z7E02nriZLCUkjUZH8RCVmP9nWujhLfeXs52uhOI47+ACYdUijVqcEDocL
         Rs1xiFAb79uo17B7/jXRoqTLA6ISsJU6yEymLHrMfj1aWFqifTahP/+U6f3diC0caoSc
         cVb5B+72L5XXTNRWaMogOzyneTktGMOMfJxRje+kCq3mg7UIL0zceDRyK6/xRCJV+A94
         3y+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787665788; x=1788270588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHkrlsCndgE2YxDUNwvQj5eIRLdielzDJx5kJiaaFSU=;
        b=OSNRG8Zkwcz3ax/dJbrd6Tq7WBZ7zUQDCpEFk0KO5dl+rGjISwTkIkxJBRhOjqV9/4
         LxdIEnEdH/4BQV94WgX3aM5ziXbNrPA0iaoiqN9qhuMfLKW15gCogrWa2EO/qFZ3g9x0
         UDYmwZchmxjYKvmLlZNe5Qjlo0k9VVAuvVpLP3OXh+kfx0sOqnLGtpCN/45U11X0zrYx
         kv8qp5eqxCjKl935cYdPBs1CXun9fL5hQt79tXtBxmvx4jV5vOnpMyNKYzK1bKTrooLX
         Jq4LN/G0FvX/C27ThTrr1Q+H8C/YL1d+KD8CWvPrT7wPWweL/vYFiEz/eyjXm0eto2dM
         UCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787665788; x=1788270588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHkrlsCndgE2YxDUNwvQj5eIRLdielzDJx5kJiaaFSU=;
        b=keOi5dtgPxSgvFLYF5Y9aWmCSsyKP/s+Bwyi0E58x8vuc3pB6N2GmcudbqAFzDymdQ
         xl84AoEFrRws3vzc6iMQXukLuO1d8deaQGah9eE/YlBnnWWhPeege7PieWy4TGC8zOIy
         20j0TlKiQ0bT2rLFuSGqay2DfFylL3MUGRQriYASRsmCOTiV2O/mTMSH69+sMjwm0kGa
         cebNODzU+JJMKVq9kAXbQjoPfRHIjxfjhNtS4lFsDXxKksPzpxfa0YmAJrG7LEj8sXHY
         TiZbFluWY9n82UDJ9xpu2QFB2XmEP58Imvo3a9GQLuD390uVyJWrN3Zd4dQyMkRi30SG
         Bk6A==
X-Forwarded-Encrypted: i=1; AHgh+RrWRsMWM+Owb8GFtw7mLYTH+szkjPx0jjMF8u9RX0dySM9AnQie3f6c5MrnSaSc/66Ydnul2yvBOxNX@vger.kernel.org
X-Gm-Message-State: AFuF++kux2L2vF8uUAZa1gis89dwOIWtv5JxAPiHhfjjiOv6I7nA7jyu
	UclXvHXDWzpTO7QOrArHHHEEgG/ZRMBgOsFsZMTpHqb0wFoHClMpTeIT+wmLDVkFbtJoRKIFEHL
	Xnlu8PIonUmNQbqexYdSV5N1JDdcynJNGEs+MPt4w6M71DDrFFaf+VrMHKaGCDVcEpksPlL+kfV
	qgmVVxbK4LFyTLG/m7PbUf/4JP31E9ntuH97+utw==
X-Gm-Gg: AR+sD12GX78EkHi2MnR+kbPKcM50JkmiHD8RTVKGrSDrP6mXYxQzxiRxaZc89pGaI9+
	qe1w0lqhmNpRM5G6BUyPOpq9iECOn++4fs8iggL9lrG1F38M6KYhZHX6HbgDVeDDc2D5uQKRHXg
	XAr18eXr2/GaAQoAbNlgcjz2U+EQWSHPPaBfYauQz3vWitZc7imeEylEMtoUOno48+R3pjdHVGg
	NhGnqSTkrMTNAaRr2YY1l9YwmqOTECK7vY3GcArYhAoH+K7oQCaA1pHAIg=
X-Received: by 2002:a05:6a20:94c9:b0:3cc:8344:1213 with SMTP id adf61e73a8af0-3cd2fe7a37cmr62152209637.8.1787665788362;
        Tue, 25 Aug 2026 06:49:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:94c9:b0:3cc:8344:1213 with SMTP id
 adf61e73a8af0-3cd2fe7a37cmr62152075637.8.1787665787818; Tue, 25 Aug 2026
 06:49:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ao2ZkNr2eHlUD2RH@sirena.org.uk>
In-Reply-To: <ao2ZkNr2eHlUD2RH@sirena.org.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 25 Aug 2026 15:49:31 +0200
X-Gm-Features: AcwNN1XOKwOcFmvGWNQRsX32r7BQLP6BOMyyK7Esj6Yi2KrX-768JIpvndCJBPE
Message-ID: <CABgObfa3xML+PJK0242GiHs1warwSrf4ikN4wTTtwOUdFazhRw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kvm-x86 tree with the kvm tree
To: Mark Brown <broonie@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 3:33=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi all,
>
> Today's linux-next merge of the kvm-x86 tree got a conflict in:
>
>   tools/testing/selftests/kvm/steal_time.c
>
> between commit:
>
>   15a9a2ba0c546 ("Merge tag 'kvm-x86-selftests2-7.3' of https://github.co=
m/kvm-x86/linux into HEAD")
>
> from the kvm tree and commit:
>
>   12c2a7f18f579 ("Merge branch 'selftests2'")
>
> from the kvm-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, this is just a small difference in how I fixed the conflict
between multiple kvm-x86 pull requests. Either version is fine, and
Sean will force-push to Linus's tree at some point anyway.

Paolo

>
> diff --combined tools/testing/selftests/kvm/steal_time.c
> index bc3c62b72c58c,6e9cc0e34ec07..0000000000000
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@@ -549,7 -549,7 +549,7 @@@ int main(int ac, char **av
>                 /* Steal time from the VCPU. The steal time thread has th=
e same CPU affinity as the VCPUs. */
>                 run_delay =3D get_run_delay();
>                 kvm_pthread_create(&thread, NULL, do_steal_time, NULL);
>  -              kvm_pthread_getaffinity_np(thread, sizeof(cpuset), &cpuse=
t);
>  +              kvm_pthread_getaffinity(thread, &cpuset);
>                 TEST_ASSERT(CPU_COUNT(&cpuset) =3D=3D 1 && CPU_ISSET(cpu,=
 &cpuset),
>                             "Worker failed to inherit parent's CPU affini=
ty");
>

