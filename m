Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34513CEB8A
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790976365; cv=none; b=B5uWm0dwPzq3sBysLM7JmlYSPWYeNKBonaUdtNjr6kUgq+qG9MAa1uNBXOv8z+kM8eQLi98RuecrTD6vT/M2nAcbGDhNwMqKpldRgp0Uz8PKng6SRxxVX/FF/AiCQkuSGIIrQ5ZfZFBuu8SBlS64zMuP77sfSVcs9U9iwHNCgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790976365; c=relaxed/simple;
	bh=oFV142JklmfjeuTJ8Sn0fR+mwMIdMQtI7Lr6DSIvH4o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rJPh8kEoyM+G+K0lk0JbM/efQz/WBoez/CSgzq9HBxrN9aYmoeoxQwFpI1Myc7MuS/hpPwk23ZYUSypti+1po6v3Zn7qCRmkFqseOBeWHl8KScPidPMQXcQa2H8kANwJ1KaDF7IWJhiZbK2LVkHbUFefxBQfsMM42Dp1Uv5u2aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ifx4CcWB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ifx4CcWB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFDC1F00898
	for <linux-next@vger.kernel.org>; Fri,  2 Oct 2026 21:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790976364;
	bh=oFV142JklmfjeuTJ8Sn0fR+mwMIdMQtI7Lr6DSIvH4o=;
	h=From:Date:Subject:To:Cc;
	b=Ifx4CcWBDsgkibvwPXHhaSbvTs8omP1WofI8ei3OtvsqZNPjmsBt6R9n6Y3Lecjh2
	 nbPIedgyUEZ2afA9fP7H4viWU34ZkYbc4Hn57/OjanpDKGu7azfGtPfEcdg76GLHYT
	 06EoU0PVTJcEuRrmK0c7LfDzNtMD9cLqMsJI2ukZmvTKVBa2Qf4173xNm3HGE/gU3z
	 qWyC5hvVQiXRh2r4OAeOBmhk0jfJJzXOVI+13AKuo0X/w5PuDmWTSs0O+xtAcwrgz7
	 6nDv0lqAfXnXsqUuceXSEoKtO/amYQ2RDF27IjTQHX5uoBeGnm5l0hXhQqOOM74AFy
	 9h6HaTrUdjodw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so2080801fa.3
        for <linux-next@vger.kernel.org>; Fri, 02 Oct 2026 14:26:04 -0700 (PDT)
X-Gm-Message-State: AFq9FYLEeaWO8+NFAwyump2IiTVuidxjZKFfmTHWLatoq67AyeNpWBr3
	LJ3759AD+jCqs8fTiGdYZW0PN++8VyllC+N0yhOK/JpLcLfhvkCywQSdKJv7VEr8KzD7agco/gn
	s56PWwixsACG7UQMTvlDbvSdprWwDmJs=
X-Received: by 2002:a2e:be0b:0:b0:3a9:71fc:5758 with SMTP id
 38308e7fff4ca-3a974f70efdmr1108281fa.27.1790976362986; Fri, 02 Oct 2026
 14:26:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Oct 2026 23:25:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLmNL0HU1pECen0X8P-KGmb0e-j_Q8G0wzqMMXcKx-F1Cw@mail.gmail.com>
X-Gm-Features: AclHuK_S-X2HZ9NR_hMk_2MQohDcYc-05FI9AHb3s5japDL5CHo3aS9G6CLXlx0
Message-ID: <CAD++jLmNL0HU1pECen0X8P-KGmb0e-j_Q8G0wzqMMXcKx-F1Cw@mail.gmail.com>
Subject: linux-next inclusion request: ux500-dts-for-soc
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

Krzysztof pointed out to me that I should run my SoC stuff through
linux-next before sending pull requests. He's right.

Can you please include:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git for-next
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
for-next

Into the linux-next tree?

They will contain a mixture of DTS and SoC patches, the rest for these
platforms will go in through maintainer trees.

Yours,
Linus Walleij
