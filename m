Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE6B272E56;
	Wed,  8 Apr 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662301; cv=none; b=PevsA7JU8sKV3EKiQUjPuKOM153ct3bIwW7PYK0/46kWO8XYey3LACIY5hjGbFPVX8NrLLgpuILn9EpRpsoxU3P0h1rBT0XWny+ha3wx47gJXpaW8mjcsv6S88D8Blt5jw8JRzxMcKu4LIIPFZ7OZsCGX+SepZKnaYTdCNGLDJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662301; c=relaxed/simple;
	bh=JkESzYI6CJxCESBwDMKE63qDwi2XqT54cp/kKxJsGfA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf3sOG34/yL/xyl9AGT9J7uywy9jRqdB2oM/stGO55YW10xRdMwhcdALWV0M/NJTnBlEonBsum6+IsWQY1b1yNIJedbkaoqhRqaLtsLB2X4ndeCdr5MakEUZKpoYPQGs2NbNOY/VAbGu98gCCVdebQZhEBrkIk2VrfdVqdjV1/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3bd4jj4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3bd4jj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03467C19421;
	Wed,  8 Apr 2026 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775662301;
	bh=JkESzYI6CJxCESBwDMKE63qDwi2XqT54cp/kKxJsGfA=;
	h=Date:From:To:Cc:Subject:From;
	b=o3bd4jj4tbuE4HEQDcahF6QZmxKWW+JFtznuH/kE44UPZ+NnNJ0Ox+kdzTcXe7ywH
	 5dcrzTgBNvuUoFRWsLeyMYH/i+nWpPr6AkHf8LLVOak+B1o4YMHBTt06HW9QHBIUXg
	 XTvsH+nnJVanoU6sEE5q4ss2Wqi33+WL9QQA0RH6YLvVGvrClhNJh2k75nypqdqUQh
	 vXIDryD0XfR4HCGMZGFv/f0L51ljwGqh4CPAou5H6pDF99D2dd67FCLIsb0pYlCNWT
	 i7vAbvx29F4/6SrpsGyI3jZ4DDcwfVf9aqvL1nOuKJz741ExizWlftajL+xieHC8ml
	 XOM5YIWanQhXQ==
Date: Wed, 8 Apr 2026 16:31:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kvms390 tree with the origin tree
Message-ID: <adZ02aKl71dRWGse@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

Today's linux-next merge of the kvms390 tree got a conflict in:

  tools/testing/selftests/kvm/Makefile.kvm

between commit:

  0c6294d98a6df ("KVM: s390: selftests: Add IRQ routing address offset tests")

from the origin tree and commit:

  857e92662c075 ("KVM: s390: selftests: enable some common memory-related tests")

from the kvms390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I note that it's traditional to sort these lists to minimise
conflicts...

diff --cc tools/testing/selftests/kvm/Makefile.kvm
index 7c2713967c699,057f17d6b896d..0000000000000
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@@ -207,7 -203,7 +205,8 @@@ TEST_GEN_PROGS_s390 += s390/ucontrol_te
  TEST_GEN_PROGS_s390 += s390/user_operexec
  TEST_GEN_PROGS_s390 += s390/keyop
  TEST_GEN_PROGS_s390 += rseq_test
 +TEST_GEN_PROGS_s390 += s390/irq_routing
+ TEST_GEN_PROGS_s390 += mmu_stress_test
  
  TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
  TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
