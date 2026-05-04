Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747831DDBB;
	Mon,  4 May 2026 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927813; cv=none; b=itmMH5V0Zg8KsoeyV4ETQPbjjA+zqXuaatyxvDgDNxE8mpcXYMnw64CP5FqSyk/sGQep1pqKebbatU/+ahnrZsSehU87U7UFpX2zk864a0uosCDkU4wBWYb9JqJVqrOOT3V5Xf6Oi8jPYnJXswqkhY3GvUveJWbMbE1zAr0rYWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927813; c=relaxed/simple;
	bh=hsT0ZiIj/UeCWn58hvdMl4o3Yr2UizS/krTtsAN0w4E=;
	h=From:Date:Message-ID:To:Cc:Cc:Subject; b=EzJ+oZwe953T5EjctuYq/HLf1Dg+TLHpYxdoxoeAjKFtFcTv0nJJIrFfFLgZnusumDQ9mD+PqiJ5zeDSLDq1b3vC1aIKYjVJiu4zYRxf0TIjudggYChLPPiy6h2GLOI4rBAek0wqEE7SQRWueIUqgwBaBWB+dE+o3zdeHi9ZvYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svuKpTkd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svuKpTkd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958C5C2BCB8;
	Mon,  4 May 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777927813;
	bh=hsT0ZiIj/UeCWn58hvdMl4o3Yr2UizS/krTtsAN0w4E=;
	h=From:Date:To:Cc:Cc:Subject:From;
	b=svuKpTkdWlft7aQ2sG0wqIt65R6Kc24yFPXx9LF8Q4OuU8TILqH9rp30BVM0ATkYs
	 /WSz9xzweNpRRzTIjydplNUAbsboENIYdv2KZ1iLrAL9bOU6x9raYqFWIJ72ooERYU
	 WEndprxa9tAPJu48jgl+uZegjhUOchucwfHewGNi1eWvdCB/Adqjh7+BMATHOFkiLF
	 RBQHif0WUhaBZf/07UrMpjEVsdIaDl8KFXXNM6QT5bnNE3sk1+Mzw0/sl8DhpptB9b
	 4oM9jm8gUjsunIfB952cE1j1/AkpLbnkx62jIQ30L28ZU0IaPzMhDs9UMZUU00WFXf
	 i/MJaJCrQjXkA==
From: Thierry Reding <thierry.reding@kernel.org>
Date: Mon, 04 May 2026 22:50:10 +0200
Message-ID: <e06a424df9659ec00dc929be6f50ac51@kernel.org>>
To: David Heidelberg <david@ixit.cz>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: omission of the nfc tree
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Hi all,

Today's linux-next merge of the nfc tree got a conflict in a bunch of
files. It looks like you based this tree on next-20260430 and this
causes a bunch of old trees being pulled into today's linux next and
that results in a lot of conflicts.

Your for-next branch should always be based on -rc1 or some later -rc
if there's a need. It should *never* be based on a previous linux-next
build.

I'm omitting the nfc tree today. Please fix this so that the tree can
be included in linux-next.

Thanks,
Thierry
